Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9164274658
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Jul 2026 17:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783963018; cv=none; b=BKiO2xBqZkn4j0a//V9Z+H7bNMCRWo3xN1WhtYdpsKDMCA+MhMKXeHce8NLojskkVKeHXSeUSLYuyXL/HTCChlN9WpajbfvttToYoD40LtOiOUdxLuu6F3vIsbYzpFaAcdS6YItTVkthggzIb0BR/c9MP9JNLPpys5kgkT0zc5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783963018; c=relaxed/simple;
	bh=D2R8QizWQ1Oql3WPKOFAzvhJaMnvI8vie8NTAJWg3Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WEU2ykVU5/raJts+bfVyinZM0SAl2ghd33mzFOJ34DFaC/upNNfOOJREp4UkWHkfQosHytP9uoOIT5Vlq5s1Nd+D3P8nXyDhAUHCf8u832OOszyPp21qv60D8jST9z7R20GNXmSjvI7PsdQPuZyWGOIPJJk2iIP0KqtQOU/mr0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xofpQroK; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xofpQroK"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8486672f03cso3028962b3a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Jul 2026 10:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783963016; x=1784567816; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QMgQ2I83fSpv8VMH24bAJ52LUeteHATXzfSwUe6AnTM=;
        b=xofpQroK4pwX9J6S9Vcf6aTb52C7dX8F49tJEuXn+7UCvrlGoSL5wOWiHE9AfQdA1F
         kcxdtKzrKb7xgcD6IP+Tv2BSOU/ouqnDzk+tEurIhV6AKunMbxsiIc6bJWKnFjH3Ju7E
         vnqi/8SDiV1thofzLe9w6sg+JwAxoBBByNbRUqKZgnTceVaGvqt9AzuhQVweFNbxJYir
         hV7cCGOg8vHJKDkwyBk8AbibWMTQA3Z3/HiElK6WSU8I3f72RwhMrDOe4tB4Fuy41iCe
         JnFm91Ky/R0uQxuUCaduXxgaJalnrD/IxIiHIrH2M3bUIW07M4Pv07XnIxEXIHkqc48Q
         3JeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783963016; x=1784567816;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMgQ2I83fSpv8VMH24bAJ52LUeteHATXzfSwUe6AnTM=;
        b=mbsoIouA998UsReFVCqn/KPlEpQPXqTeQhM7g9JnKTrJe5VgOrjZveeUmiJRDFNdYf
         ddAXD0mkyKHbQ2SFPvBYHwzefWt3Ego2e64hgGBrEBSEkVrybjgzAv1aZ20V1Sz8HlIs
         QeAZrK3L3DWBoHP/YXlgiUOf82MrGhFtCTXAsSGYLJUSabx0enFNqOBlCBG4VD89DAad
         k0crAPpt290/+R/ov+japZFR/rrDm/ZMg5wG6reqM6JqW8CZzj6V9pTHmdoLq00AoHym
         2srX1cHixnn+ftqPfywLGbLE6Zn0qny0CB/qyd2ej0FrmYd4EKv1sDE1iRAae8aBJMrb
         HayA==
X-Forwarded-Encrypted: i=1; AHgh+RonMUTF7JJ6EfKUCQTzxLVu54xdXvDAIrtRKwpSmOGlkqXJfObNsOJ+OxmBein214A6TBvWxdmXCnlIGYvZmnPL@vger.kernel.org
X-Gm-Message-State: AOJu0YwRSQMsnf3AUaJuxlBZUU3OIxT678w5zdVD8M8MHaWFT5Y81qVH
	s+MzhGdVlbZDBg4AVP2EpkSpV+3PINlP4RhTA7XVfFtxQ1mHMFTHs/jALSb1qCRjyD0=
X-Gm-Gg: AfdE7clJdaUGVEm7gS9Q3C+RmNJ6pLPlkzPDjgFb+dOtTny57OSDhek+fiKOhsSMWoE
	+I1K9HSX7HgyzeDiiUOIGaQbHbUfLrq1+i+qwjslnRI80OzgXlSrAvMq6uAR6F/9b1SBmCBQVxb
	JF0cX64hs3BiD+BnpnLDIIZkDn0t63xkbIKn7MevqeER3BEi7PTREOM3oV+MROFJBtXgFK8drFW
	8+Wxi0VMTIzYDxAXuVXYZLrXUJkioDKGFJDttA+LNzSGNUEe3iaEEXkHPafTopuxrq+L7teyeCU
	2UklpkMrAK2k3W9t0unX3M5qQDUhzaa5hJOIUoRQgH828SJrhvin2MYO2pdKz0SfB/tCi2BYOH3
	ltKkNO28X6mymIFkgsBekhUFTzQyOY7No8KqU4XKo9CEpCToNi94MFQgxBlXE5Ll4aZ4YaH1BsA
	/EfuwRcbpdb//cYH6+NavNgZUCZO8=
X-Received: by 2002:a05:6a00:4405:b0:848:2f7a:2e56 with SMTP id d2e1a72fcca58-84889753bcfmr8957113b3a.69.1783963016003;
        Mon, 13 Jul 2026 10:16:56 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3ead:2a56:27bf:77cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm137812b3a.59.2026.07.13.10.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:16:55 -0700 (PDT)
Date: Mon, 13 Jul 2026 11:16:51 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
Message-ID: <alUdg9iTysXCFUa5@p14s>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-2-shenwei.wang@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625155432.815185-2-shenwei.wang@oss.nxp.com>

On Thu, Jun 25, 2026 at 10:54:26AM -0500, Shenwei Wang wrote:
> From: Shenwei Wang <shenwei.wang@nxp.com>
> 
> Describes the gpio rpmsg transport protocol over the rpmsg bus between
> the remote system and Linux.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  Documentation/driver-api/gpio/gpio-rpmsg.rst | 271 +++++++++++++++++++
>  Documentation/driver-api/gpio/index.rst      |   1 +
>  2 files changed, 272 insertions(+)
>  create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
> 
> diff --git a/Documentation/driver-api/gpio/gpio-rpmsg.rst b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> new file mode 100644
> index 000000000000..7d351ff0adb0
> --- /dev/null
> +++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> @@ -0,0 +1,271 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +GPIO RPMSG (Remote Processor Messaging) Protocol
> +================================================
> +
> +The GPIO RPMSG transport protocol is used for communication and interaction
> +with GPIO controllers on remote processors via the RPMSG bus.
> +
> +Message Format
> +--------------
> +
> +The RPMSG message consists of a 8-byte packet with the following layout:
> +
> +.. code-block:: none
> +
> +   +------+------+------+------+------+------+------+------+
> +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> +   |     cmd     |    line     |           value           |
> +   +------+------+------+------+------+------+------+------+
> +
> +- **cmd**: Command code, used for GPIO_RPMSG_SEND messages.
> +
> +- **line**: The GPIO line (pin) index of the port.

Here and throughout, please remove any mention of 'port'.  This is handled by
the endpoint device, i.e one GPIO controller (port) per endpoint.

> +
> +- **value**: See details in the command description below.
> +
> +
> +GPIO Commands
> +-------------
> +
> +Commands are specified in the **Cmd** field.
> +
> +The SEND message is always sent from Linux to the remote firmware. Each
> +SEND corresponds to a single REPLY message. The GPIO driver should
> +serialize messages and determine whether a REPLY message is required. If a
> +REPLY message is expected but not received within the specified timeout
> +period (currently 1 second in the Linux driver), the driver should return
> +-ETIMEOUT.
> +
> +GET_DIRECTION (Cmd=2)
> +~~~~~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +------+------+------+------+------+------+------+------+
> +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> +   |      2      |    line     |             0             |
> +   +------+------+------+------+------+------+------+------+
> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +------+--------+--------+
> +   | 0x00 |  0x01  |  0x02  |
> +   |   1  | status | value  |
> +   +------+--------+--------+
> +
> +- **status**:
> +
> +  - 0: Ok
> +  - 1: Error
> +
> +- **value**: Direction.
> +
> +  - 0: None
> +  - 1: Output
> +  - 2: Input
> +
> +
> +SET_DIRECTION (Cmd=3)
> +~~~~~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +------+------+------+------+------+------+------+------+
> +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> +   |      3      |    line     |           value           |
> +   +------+------+------+------+------+------+------+------+
> +
> +- **value**: Direction.
> +
> +  - 0: None
> +  - 1: Output
> +  - 2: Input
> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +------+--------+--------+
> +   | 0x00 |  0x01  |  0x02  |
> +   |   1  | status |    0   |
> +   +------+--------+--------+
> +
> +- **status**:
> +
> +  - 0: Ok
> +  - 1: Error
> +
> +
> +GET_VALUE (Cmd=4)
> +~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +------+------+------+------+------+------+------+------+
> +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> +   |      4      |    line     |             0             |
> +   +------+------+------+------+------+------+------+------+
> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +------+--------+--------+
> +   | 0x00 |  0x01  |  0x02  |
> +   |   1  | status | value  |
> +   +------+--------+--------+
> +
> +- **status**:
> +
> +  - 0: Ok
> +  - 1: Error
> +
> +- **value**: Level.
> +
> +  - 0: Low
> +  - 1: High
> +
> +
> +SET_VALUE (Cmd=5)
> +~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +------+------+------+------+------+------+------+------+
> +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> +   |      5      |    line     |           value           |
> +   +------+------+------+------+------+------+------+------+
> +
> +- **value**: Output level.
> +
> +  - 0: Low
> +  - 1: High
> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +------+--------+--------+
> +   | 0x00 |  0x01  |  0x02  |
> +   |   1  | status |    0   |
> +   +------+--------+--------+
> +
> +- **status**:
> +
> +  - 0: Ok
> +  - 1: Error
> +
> +
> +SET_IRQ_TYPE (Cmd=6)
> +~~~~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +------+------+------+------+------+------+------+------+
> +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> +   |      6      |    line     |           value           |
> +   +------+------+------+------+------+------+------+------+
> +
> +- **value**: IRQ types.
> +
> +  - 0: Interrupt disabled
> +  - 1: Rising edge trigger
> +  - 2: Falling edge trigger
> +  - 3: Both edge trigger
> +  - 4: High level trigger
> +  - 8: Low level trigger

I'm in agreement with cmd 3, 4, 5 and 6.  

> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +------+--------+--------+
> +   | 0x00 |  0x01  |  0x02  |
> +   |   1  | status |    0   |
> +   +------+--------+--------+
> +
> +- **status**:
> +
> +  - 0: Ok
> +  - 1: Error
> +
> +SET_WAKEUP (Cmd=16)
> +~~~~~~~~~~~~~~~~~~~

I already commented on messages that are not part of the virtio-gpio
specification.  

> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +------+------+------+------+------+------+------+------+
> +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> +   |      1      |    line     |           value           |
> +   +------+------+------+------+------+------+------+------+
> +
> +- **value**: Wakeup enable.
> +
> +  The remote system should always aim to stay in a power-efficient state by
> +  shutting down or clock-gating the GPIO blocks that aren't in use. Since
> +  the remoteproc driver is responsible for managing the power states of the
> +  remote firmware, the GPIO driver does not require to know the firmware's
> +  running states.
> +
> +  When the wakeup bit is set, the remote firmware should configure the line
> +  as a wakeup source. The firmware should send the notification message to
> +  Linux after it is woken from the GPIO line.
> +
> +  - 0: Disable wakeup from GPIO
> +  - 1: Enable wakeup from GPIO
> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +------+--------+--------+
> +   | 0x00 |  0x01  |  0x02  |
> +   |   1  | status |    0   |
> +   +------+--------+--------+
> +
> +- **status**:
> +
> +  - 0: Ok
> +  - 1: Error
> +
> +Notification Message
> +--------------------

"Interrupt Messages"

> +
> +Notifications are sent by the remote core and they have
> +**Type=2 (GPIO_RPMSG_NOTIFY)**:
> +
> +When a GPIO line asserts an interrupt on the remote processor, the firmware
> +should immediately mask the corresponding interrupt source and send a
> +notification message to the Linux. Upon completion of the interrupt
> +handling on the Linux side, the driver should issue a
> +command **SET_IRQ_TYPE** to the firmware to unmask the interrupt.
> +
> +A Notification message can arrive between a SEND and its REPLY message,
> +and the driver is expected to handle this scenario.
> +
> +.. code-block:: none
> +
> +   +------+------+--------+
> +   | 0x00 | 0x01 |  0x02  |
> +   |   2  | line | trigger|
> +   +------+------+--------+

2 things here:

1) You did not include messages that mask and unmask interrupts at the driver
side.

2) We are carrying virtio-gpio messages on top of RPMSG and as such, this whole
protocol should be about thar:  

+------+------+--------+--------
| 0x00 |       payload         |          
|  Q   |                       | 
+------+------+--------+--------

Q = 0 requestq
Q = 1 eventq

The "payload" part is simply the format of the messages as found in the
virtio-gpio specification.  From there, the only thing left to mention is which
messages are not supported, i.e get line names.

> +
> +- **line**: The GPIO line (pin) index of the port.
> +
> +- **trigger**: Optional parameter to indicate the trigger event type.

Not part of the spec - remove.

Given the refactoring work that is still needed, I will not look at the
implementation.

Thanks,
Mathieu

> +
> diff --git a/Documentation/driver-api/gpio/index.rst b/Documentation/driver-api/gpio/index.rst
> index bee58f709b9a..e5eb1f82f01f 100644
> --- a/Documentation/driver-api/gpio/index.rst
> +++ b/Documentation/driver-api/gpio/index.rst
> @@ -16,6 +16,7 @@ Contents:
>     drivers-on-gpio
>     bt8xxgpio
>     pca953x
> +   gpio-rpmsg
>  
>  Core
>  ====
> -- 
> 2.43.0
> 
