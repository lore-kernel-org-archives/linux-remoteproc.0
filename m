Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C182D246BC7;
	Thu,  6 Nov 2025 19:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762455963; cv=none; b=fjKKmAlhBQJECN6JtGhy4JAK43OxJgPzc3TSzS2I9/BpAmv+RZMYEwvDGoiaAWHq2qXoNXUMHy3aGB+3NtRA8F1HQhU2jkI1r2KfdZBb3ReRzBY70/V/rllRYOtT7Vn03Ae5HnDDwEKKDzmm4yfHQAlfXynOH+5RPyCp+B6uFaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762455963; c=relaxed/simple;
	bh=EGr5ADH3WdxhvthOZ0dh2EE7Glu6ClTmA+bHRUkMJjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hiOXA6cC4PLCSmOXPh6cIp3xtCxikj47VF+PLCv7R45ZyqN4cceirHMHVo9xFwHBDGGDJz7qAu87KFM+ABVUGf7lyoMYd8DoidezuGoq4tz15xWGOlXIPEmf8tEK7x/DuLqhWZ5FsaAQpXLwzMJZo5CohtgYGsJeFuw66OTp+FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=FQtfPdRB; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="FQtfPdRB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=VTVwOrLx1UbE0Vl3BjsmOsYDPFhlnrm5D/cBlveQU0c=; b=FQtfPdRBFzpQkercfXOel4CHob
	PBuWKc3onbvnRWQTgjNel017mgzQ6E+kJ208LhMfDe66dPD/pSKlOr7DK+fIgfNm9h+iMNAefwM89
	qBlj12ogwElccciqMkbAl4fnSQUM7sOdPJJRtpGO3maEG+KF8n0wzoX6VwyCvfuurGFc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vH5Is-00D9Ej-Cl; Thu, 06 Nov 2025 20:05:50 +0100
Date: Thu, 6 Nov 2025 20:05:50 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-imx@nxp.com
Subject: Re: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
Message-ID: <9fd8ccd9-560a-43b4-a48d-f7a3eaa07eb1@lunn.ch>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-4-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104203315.85706-4-shenwei.wang@nxp.com>

On Tue, Nov 04, 2025 at 02:33:13PM -0600, Shenwei Wang wrote:
> Describes the gpio rpmsg transport protocol over the rpmsg bus between
> the cores.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  Documentation/staging/gpio-rpmsg.rst | 202 +++++++++++++++++++++++++++
>  Documentation/staging/index.rst      |   1 +
>  2 files changed, 203 insertions(+)
>  create mode 100644 Documentation/staging/gpio-rpmsg.rst
> 
> diff --git a/Documentation/staging/gpio-rpmsg.rst b/Documentation/staging/gpio-rpmsg.rst
> new file mode 100644
> index 000000000000..ad6207a3093f
> --- /dev/null
> +++ b/Documentation/staging/gpio-rpmsg.rst
> @@ -0,0 +1,202 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +GPIO RPMSG Protocol
> +===================
> +
> +The GPIO RPMSG transport protocol is used for communication and interaction
> +with GPIO controllers located on remote cores on the RPMSG bus.
> +
> +Message Format
> +--------------
> +
> +The RPMSG message consists of a 14-byte packet with the following layout:
> +
> +.. code-block:: none
> +
> +   +-----+------+------+-----+-----+------------+-----+-----+-----+----+
> +   |0x00 |0x01  |0x02  |0x03 |0x04 |0x05..0x09  |0x0A |0x0B |0x0C |0x0D|
> +   |cate |major |minor |type |cmd  |reserved[5] |line |port |  data    |
> +   +-----+------+------+-----+-----+------------+-----+-----+-----+----+
> +
> +- **Cate (Category field)**: Indicates the category of the message, such as GPIO, I2C, PMIC, AUDIO, etc.

We know it is a GPIO message, this document is titled "GPIO RPMSG
Protocol". So i don't see the need for cate. I can however understand
that your device does support multiple functions, but to make this
generic, it would be better if each function had its own channel.

> +
> +  Defined categories:
> +
> +  - 1: RPMSG_LIFECYCLE
> +  - 2: RPMSG_PMIC
> +  - 3: RPMSG_AUDIO
> +  - 4: RPMSG_KEY
> +  - 5: RPMSG_GPIO
> +  - 6: RPMSG_RTC
> +  - 7: RPMSG_SENSOR
> +  - 8: RPMSG_AUTO
> +  - 9: RPMSG_CATEGORY
> +  - A: RPMSG_PWM
> +  - B: RPMSG_UART
> +
> +- **Major**: Major version number.
> +
> +- **Minor**: Minor version number.

What is the purpose of Major and Minor? What values are valid. What
should happen if an invalid value is passed?

What you should think about is, if you gave this specification to
somebody else, could they implement it? 

> +
> +- **Type (Message Type)**: For the GPIO category, can be one of:
> +
> +  - 0: GPIO_RPMSG_SETUP
> +  - 1: GPIO_RPMSG_REPLY
> +  - 2: GPIO_RPMSG_NOTIFY

Is _SETUP always from Linux to the firmware? Is a setup always
followed by a _REPLY? Do you need to wait for the _REPLY before
sending the next _SETUP? If there is no _REPLY within X seconds, should
Linux retry? Can an _NOTIFY arrive between a _SETUP and a _REPLY?

> +
> +- **Cmd**: Command code, used for GPIO_RPMSG_SETUP messages.
> +
> +- **reserved[5]**: Reserved bytes.

Why are these in the middle. It is more normal to have reserved bytes
at the end.

You should also specify these bytes should be set to 0. If you don't
it will be hard to use them in the future, because they will contain
42, or some other random values.

Is there a relationship between major:minor and reserved?

> +
> +- **line**: The GPIO line index.
> +
> +- **port**: The GPIO controller index.

data? 

> +GPIO Commands
> +-------------

This is a GPIO specification, so i would only expect GPIO commands...

> +
> +Commands are specified in the **Cmd** field for **GPIO_RPMSG_SETUP** (Type=0) messages.
> +
> +GPIO_RPMSG_INPUT_INIT (Cmd=0)
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
> +   | 5   | 1   | 0   | 0   | 0   |  0        |line |port | val | wk |
> +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> +
> +- **val**: Interrupt trigger type.
> +
> +  - 0: Interrupt disabled
> +  - 1: Rising edge trigger
> +  - 2: Falling edge trigger
> +  - 3: Both edge trigger
> +  - 4: Low level trigger
> +  - 5: High level trigger
> +
> +- **wk**: Wakeup enable.
> +
> +  - 0: Disable wakeup from GPIO
> +  - 1: Enable wakeup from GPIO

What do you mean by wakeup? 

> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
> +   | 5   | 1   | 0   | 1   | 1   |  0        |line |port | err | 0  |
> +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> +
> +- **err**: Error code from the remote core.
> +
> +  - 0: Success
> +  - 1: General error (early remote software only returns this unclassified error)
> +  - 2: Not supported
> +  - 3: Resource not available
> +  - 4: Resource busy
> +  - 5: Parameter error

It would be good to give some examples of when these should be used.

Say the hardware does not support both edges. Is that 2? Why would a
resource be busy? How is busy different to not available?

> +
> +GPIO_RPMSG_OUTPUT_INIT (Cmd=1)
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
> +   | 5   | 1   | 0   | 0   | 1   |  0        |line |port | val | 0  |
> +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> +
> +- **val**: Output level.
> +
> +  - 0: Low
> +  - 1: High

Maybe make a comment about the order. Some GPIO controllers suffer from
glitches when you swap them from input to output. While it is an
input, you first need to set the output value, and then configure the
pin for output. 

> +Notification Message
> +--------------------
> +
> +Notifications are sent with **Type=2 (GPIO_RPMSG_NOTIFY)**:
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
> +   | 5   | 1   | 0   | 2   | 0   |  0        |line |port | 0   | 0  |
> +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> +
> +- **line**: The GPIO line index.
> +- **port**: The GPIO controller index.

There is no need to acknowledge the notification? How do level
interrupts work?

	Andrew
