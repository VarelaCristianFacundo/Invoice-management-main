import nodemailer from 'nodemailer';

export async function sendEmail(to: string, body: string, subject: string, cc: string) {
  // Create a transporter object using SMTP transport
  let transporter = nodemailer.createTransport({
    host: 'smtp.gmail.com',
    port: 587,
    auth: {
      user: 'jmaragames@gmail.com', // Your email
      pass: 'btjw ieqt bfgf vofo', // Your email password
    },
  });

  // Setup email data
  let mailOptions = {
    from: 'jmaragames@gmail.com', // Sender address
    to: to, // List of recipients
    cc: cc, // CC recipients
    subject: subject, // Subject line
    text: body, // Plain text body
  };

  // Send mail with defined transport object
  try {
    let info = await transporter.sendMail(mailOptions);
    console.log('Message sent: %s', info.messageId);
  } catch (error) {
    console.error('Error sending email:', error);
  }
}