package com.example.demo;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.URI;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.event.EventListener;
import org.springframework.boot.context.event.ApplicationReadyEvent;

@SpringBootApplication
public class OnlineParkingSystemApplication {

	private static ConfigurableApplicationContext context;

	public static void main(String[] args) {
		// Launch the Swing application first
		App.launchSwingApp();
	}

	public static void startSpringBootApp() {
		// Start the Spring Boot application in a new thread
		new Thread(() -> {
			context = SpringApplication.run(OnlineParkingSystemApplication.class);
		}).start();
	}

	@EventListener(ApplicationReadyEvent.class)
	public void onApplicationReady() {
		// Trigger the redirection once Spring Boot has fully initialized
		App.redirectToWebsite();
	}
}

class App {
	private static JFrame frame;
	private static JLabel loadingLabel;

	public static void launchSwingApp() {
		// Create the main frame with hacker theme
		frame = new JFrame("Smart Parking System");
		frame.setSize(700, 450); // Adjusted size
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setLayout(new BorderLayout());

		// Set dark background
		JPanel mainPanel = new JPanel();
		mainPanel.setBackground(new Color(0, 0, 0)); // Black background
		mainPanel.setLayout(new BoxLayout(mainPanel, BoxLayout.Y_AXIS));
		frame.add(mainPanel);

		// Title label with hacker font and style
		JLabel titleLabel = new JLabel("Welcome to Smart Parking System");
		titleLabel.setFont(new Font("Monospaced", Font.BOLD, 32)); // Slightly reduced font size
		titleLabel.setForeground(new Color(0, 255, 0)); // Bright green
		titleLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
		mainPanel.add(Box.createRigidArea(new Dimension(0, 60)));
		mainPanel.add(titleLabel);

		// Add spacing
		mainPanel.add(Box.createRigidArea(new Dimension(0, 40)));

		// Question label with a slightly smaller font
		JLabel questionLabel = new JLabel("Would you like to book a parking space?");
		questionLabel.setFont(new Font("Monospaced", Font.PLAIN, 24)); // Monospaced font
		questionLabel.setForeground(new Color(200, 255, 200)); // Light green
		questionLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
		mainPanel.add(questionLabel);

		// Add spacing
		mainPanel.add(Box.createRigidArea(new Dimension(0, 20)));

		// Buttons Panel
		JPanel buttonPanel = new JPanel();
		buttonPanel.setOpaque(false);
		buttonPanel.setLayout(new FlowLayout(FlowLayout.CENTER, 20, 0));

		// "Book Parking" button with a bright green color
		JButton bookButton = createStyledButton("Continue", new Color(22, 184, 22)); // Bright green
		buttonPanel.add(bookButton);

		// "Cancel" button with a bright red color
		JButton cancelButton = createStyledButton("Cancel", new Color(186, 24, 24)); // Bright red
		buttonPanel.add(cancelButton);

		// Add the button panel to the main panel
		mainPanel.add(buttonPanel);

		// Add spacing
		mainPanel.add(Box.createRigidArea(new Dimension(0, 50))); // Reduced spacing

		// Loading label (hidden by default)
		loadingLabel = new JLabel("Loading... Please wait.");
		loadingLabel.setFont(new Font("Monospaced", Font.ITALIC, 20)); // Monospaced font
		loadingLabel.setForeground(new Color(255, 255, 0)); // Yellow
		loadingLabel.setVisible(false);
		loadingLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
		mainPanel.add(loadingLabel);

		// Add spacing above the loading label
		mainPanel.add(Box.createRigidArea(new Dimension(0, 100)));

		// Center the frame on the screen
		frame.setLocationRelativeTo(null);
		frame.setVisible(true);

		// Add action listener for Book Parking button
		bookButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				// Show loading message and start the Spring Boot application
				loadingLabel.setVisible(true);
				frame.revalidate();
				frame.repaint();
				OnlineParkingSystemApplication.startSpringBootApp();
			}
		});

		// Add action listener for Cancel button
		cancelButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				frame.dispose(); // Close the application
			}
		});
	}

	public static void redirectToWebsite() {
		// Delay to allow the server to start
		try {
			Thread.sleep(3000); // Wait for 3 seconds
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		// Check if localhost:8080 is accessible
		if (isPortAvailable("localhost", 8080)) {
			try {
				Desktop.getDesktop().browse(new URI("http://localhost:8080"));
				frame.dispose(); // Close the Swing window
			} catch (Exception ex) {
				JOptionPane.showMessageDialog(frame, "Error: Unable to open URL.");
			}
		} else {
			JOptionPane.showMessageDialog(frame, "Server is not reachable. Please try opening http://localhost:8080 manually.");
		}
	}

	private static boolean isPortAvailable(String host, int port) {
		try (Socket socket = new Socket()) {
			socket.connect(new InetSocketAddress(host, port), 3000);
			return true;
		} catch (IOException e) {
			return false;
		}
	}

	private static JButton createStyledButton(String text, Color backgroundColor) {
		JButton button = new JButton(text);
		button.setFont(new Font("Monospaced", Font.BOLD, 18)); // Monospaced font
		button.setBackground(backgroundColor);
		button.setForeground(Color.WHITE);
		button.setFocusPainted(false);
		button.setPreferredSize(new Dimension(200, 50));
		button.setBorder(BorderFactory.createEmptyBorder(10, 20, 10, 20));
		button.setCursor(new Cursor(Cursor.HAND_CURSOR));

		button.setContentAreaFilled(false);
		button.setOpaque(true);

		button.setBorder(BorderFactory.createCompoundBorder(
				BorderFactory.createLineBorder(new Color(0, 0, 0, 30), 3),
				BorderFactory.createEmptyBorder(10, 10, 10, 10)));

		return button;
	}
}