Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89107481224
	for <linux-remoteproc@vger.kernel.org>; Wed, 15 Jul 2026 15:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784129160; cv=none; b=OUgts6vA+teBl9CXrCquysQG+05LxV6hndJAl3+T27bouIyOJJeTMyJKA3/dV8KqYJjfjsk7WhswRYc4+rhO682gJO7dh5zVxxOvZLbxVzStJJE+t5w3XJab0dw/RicggMRG8OSbhJFpWKeND5wy2DuGc1kVNZPlHcRyFXG5ahU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784129160; c=relaxed/simple;
	bh=8IfDTW8a3b3sS/iPv7vB1ZiuTNxkT5DDhwcjj8R2JRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=olstnocsvTpsLdCGiiuSeMQ7F+0SMcx6Yo4o9lC/90Y150M+XfrGtjCc4vMaDL+DVMISBHYd5RsRRVxMCXlZXgcWRz7KFTA8Dz0EccFwxL/gGh3N/8tImFelf86QSi2GAA6kHc7D27fNgOWZNOxRjx5SXIISMtN+megUpWY99Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vr4JN4/a; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vr4JN4/a"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cca0c5799eso28911435ad.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Jul 2026 08:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784129158; x=1784733958; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2kgwyk0OObBT++oiW1zqAAqUnSr/tbzGEYYjYm7Tx6U=;
        b=vr4JN4/aw/QYNhmQOV0ZnlVY5dKDn3e7X95fQ89WDWofYJKR+v3BI/DUWFO+eh+1Rd
         OVyR/TN17p0tIeF9lIbaNl2D5Cr2QR5roDiU5O6vzPX75TUZTmnWU5quxf3N/vKDmhqc
         kZVYd5U9gEZ15MY+jj8kf641j8V+U21+hegrWPeAKaefNxFhd28GyJvsCqMR3VgaEvHv
         7Fz6QpKquKfnsli/YMICBB2ZfAVERQG6sq2uDTyYXM8uwr9LniIZdlnJDvju34YhrF2C
         ZswQfpDaQj3msWkGru5R6JNulpUGf83CcCptWwVEZeC+aTgigESMzibOd3efi2rz0m16
         QSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784129158; x=1784733958;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2kgwyk0OObBT++oiW1zqAAqUnSr/tbzGEYYjYm7Tx6U=;
        b=PQsgOo/EckEx7vkACcdgcYwM0EQaTR7ibuYOxu7Y8Qg+jlu/gngBt77yJSy3u+QesZ
         dRkZbVFVHILEoI+N5nTAlWCbWVw/DmPX4K4fjiFEGgLN3ORcweTOLNMxGJJSgHzB4yCf
         lsEpiY2nQeWDpdRZc1BdlAx6tHJqYGKqu+sN+L5vrER5vJv9pgR0VhBwwY8yoSdmxY7s
         rXhjTTOgPdmi/h/bUCr/yyl96yDWlpBzzI7WbrMFUC4tnq2N+InYro7SHdzrLuRYdOUR
         tykXG9sY2fA52u0XyFxJrEn97/jJMlYhkrvopVmwZiKGAyoKE/lcYbwg+JAhiPz0A0rC
         bA0A==
X-Forwarded-Encrypted: i=1; AHgh+Ro9tUzJLWUrrZN0zZAjj98NKwcx2qW66TN4M3VSBFoDOk/bPvnSNpfrgkHzIiyCPCjqn8aCXq4HkMP16iHeFuXP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7KIyRg+LkV79dHk47dWzsH/opXTPs46iz2osFxtrMnGf6ba2V
	6/gn33G5r5Dl+PjvPB7TwIPnUfD3mKMwoP2jr0ojl6RLzJw+83eFjHiyHo/h0Hpfl8A=
X-Gm-Gg: AfdE7cn3NV8oRSduK65QR+EcLP/9Gm27HGipikof+mFj9wqcnGkoAo6B4pzKRa2G2Z9
	dpDrSkysWraP8DaQ6JX4ac41mqdX5qfGFJ5QCtMbsEldNofRuNf//WVcJpZ//GBVRQCf5yLSqTK
	O8S5iaknCaiT0ql0tEpJBYaI8XMTGhuZWoa6g4QP3VC59AU2Jp1j5Ys7t1h6ae/XyboWJBmbOQV
	+oJ8wVGX8jJaVNigtPm2M0nqwxywXrdA9F07N6j+vOAfogc6ZbEzGeJP2kVTamblKliHGxJ1VZB
	g9lU8TWrxXb1f4apWNHe+XQQa4dAi5qebtZazlmNuVl5L0qUsYKJnI9Bv/gQ9cXONSrMTn2D7A1
	KJtxcD7AXv1jaMJGTL006i9rv3l5TmW7aiVEoTiMuUwjbDo2rYFn/1PgIYKuHa3vtYNYuTlMX00
	EOsupqae1TMfqMk7RC
X-Received: by 2002:a17:902:f787:b0:2ce:d957:59c4 with SMTP id d9443c01a7336-2ced9575addmr115795235ad.6.1784129157763;
        Wed, 15 Jul 2026 08:25:57 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:4f38:9a5e:fd18:7a9b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf10156d29sm4394455ad.30.2026.07.15.08.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 08:25:57 -0700 (PDT)
Date: Wed, 15 Jul 2026 09:25:53 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	"b-padhi@ti.com" <b-padhi@ti.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
Message-ID: <alemgbM2ktRLE9wT@p14s>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-2-shenwei.wang@oss.nxp.com>
 <alUdg9iTysXCFUa5@p14s>
 <PAXPR04MB91852808D2C7491AEF98CF1589F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <alZlZvQQwq-g6VL3@p14s>
 <PAXPR04MB9185B1A3F16D82E8C0C76EE689F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185B1A3F16D82E8C0C76EE689F92@PAXPR04MB9185.eurprd04.prod.outlook.com>

On Tue, Jul 14, 2026 at 06:43:30PM +0000, Shenwei Wang (OSS) wrote:
> 
> 
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Tuesday, July 14, 2026 11:36 AM
> > To: Shenwei Wang (OSS) <shenwei.wang@oss.nxp.com>
> > Cc: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>;
> > Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
> > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn
> > Andersson <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> > gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > <festevam@gmail.com>; Shenwei Wang <shenwei.wang@nxp.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Arnaud
> > POULIQUEN <arnaud.pouliquen@foss.st.com>; b-padhi@ti.com; Andrew Lunn
> > <andrew@lunn.ch>
> > Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over rpmsg
> > bus
> > 
> > On Tue, Jul 14, 2026 at 02:29:12PM +0000, Shenwei Wang (OSS) wrote:
> d
> > > > > +  - 3: Both edge trigger
> > > > > +  - 4: High level trigger
> > > > > +  - 8: Low level trigger
> > > >
> > > > I'm in agreement with cmd 3, 4, 5 and 6.
> > > >
> > >
> > > How about cmd 2?
> > 
> > Yes, I forgot cmd 2.
> > 
> > >
> > > > > +
> > > > > +**Reply:**
> > > > > +
> > > > > +.. code-block:: none
> > > > > +
> > > > > +   +------+--------+--------+
> > > > > +   | 0x00 |  0x01  |  0x02  |
> > > > > +   |   1  | status |    0   |
> > > > > +   +------+--------+--------+
> > > > > +
> > > > > +- **status**:
> > > > > +
> > > > > +  - 0: Ok
> > > > > +  - 1: Error
> > > > > +
> > > > > +SET_WAKEUP (Cmd=16)
> > > > > +~~~~~~~~~~~~~~~~~~~
> > > >
> > > > I already commented on messages that are not part of the virtio-gpio
> > > > specification.
> > > >
> > >
> > > I don't believe virtio-gpio needs a SET_WAKEUP command.
> > >
> > > In the RPMSG case, SET_WAKEUP is required because it performs an
> > > operation on the remote processor, so the remote side must be explicitly
> > notified.
> > 
> > What operations would that be?
> > 
> 
> The operation is enabling the line as a wakeup source. In practice, this involves configuring 
> hardware-specific wakeup settings (e.g., register bits) on the remote processor, so the remote 
> side must be explicitly notified through SET_WAKEUP.
>

As I said before, we are not enhancing the virtio-gpio specification.  If the
functionality is not part of the specification, it is not part of this protocol.
 
> 
> > >
> > > For virtio-gpio, however, everything is handled locally. The other
> > > side does not need to perform any action, so sending a SET_WAKEUP command
> > appears unnecessary.
> > 
> > What is "everything"?
> > 
> 
> I mean masking, unmasking, and marking the interrupt as a wakeup source. All of 
> these operations are handled on local processor.

There may be enough capability in your remote processor to do all that, but we
can't assume the same applies to all implementations.  rpmsg-gpio is not about
inventing a new protocol or delegating actions to the remote processor.  It is
about carrying virtio-gpio packets on top of RPMSG.  It needs to operate
_exactly_ the same way as virtio-gpio.

> 
> Shenwei
> 
> > >
> > >
> > > > > +
> > > > > +**Request:**
> > > > > +
> > > > > +.. code-block:: none
> > > > > +
> > > > > +   +------+------+------+------+------+------+------+------+
> > > > > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > > > > +   |      1      |    line     |           value           |
> > > > > +   +------+------+------+------+------+------+------+------+
> > > > > +
> > > > > +- **value**: Wakeup enable.
> > > > > +
> > > > > +  The remote system should always aim to stay in a
> > > > > + power-efficient state by  shutting down or clock-gating the GPIO
> > > > > + blocks that aren't in use. Since  the remoteproc driver is
> > > > > + responsible for managing the power states of the  remote
> > > > > + firmware, the GPIO driver does not require to know the firmware's
> > running states.
> > > > > +
> > > > > +  When the wakeup bit is set, the remote firmware should
> > > > > + configure the line  as a wakeup source. The firmware should send
> > > > > + the notification message to  Linux after it is woken from the GPIO line.
> > > > > +
> > > > > +  - 0: Disable wakeup from GPIO
> > > > > +  - 1: Enable wakeup from GPIO
> > > > > +
> > > > > +**Reply:**
> > > > > +
> > > > > +.. code-block:: none
> > > > > +
> > > > > +   +------+--------+--------+
> > > > > +   | 0x00 |  0x01  |  0x02  |
> > > > > +   |   1  | status |    0   |
> > > > > +   +------+--------+--------+
> > > > > +
> > > > > +- **status**:
> > > > > +
> > > > > +  - 0: Ok
> > > > > +  - 1: Error
> > > > > +
> > > > > +Notification Message
> > > > > +--------------------
> > > >
> > > > "Interrupt Messages"
> > > >
> > > > > +
> > > > > +Notifications are sent by the remote core and they have
> > > > > +**Type=2 (GPIO_RPMSG_NOTIFY)**:
> > > > > +
> > > > > +When a GPIO line asserts an interrupt on the remote processor,
> > > > > +the firmware should immediately mask the corresponding interrupt
> > > > > +source and send a notification message to the Linux. Upon
> > > > > +completion of the interrupt handling on the Linux side, the
> > > > > +driver should issue a command **SET_IRQ_TYPE** to the firmware to
> > unmask the interrupt.
> > > > > +
> > > > > +A Notification message can arrive between a SEND and its REPLY
> > > > > +message, and the driver is expected to handle this scenario.
> > > > > +
> > > > > +.. code-block:: none
> > > > > +
> > > > > +   +------+------+--------+
> > > > > +   | 0x00 | 0x01 |  0x02  |
> > > > > +   |   2  | line | trigger|
> > > > > +   +------+------+--------+
> > > >
> > > > 2 things here:
> > > >
> > > > 1) You did not include messages that mask and unmask interrupts at
> > > > the driver side.
> > >
> > > Interrupt masking and unmasking are handled entirely on the local processor.
> > >
> > > When an interrupt occurs, the remote system masks the interrupt and
> > > then sends a notification to Linux. After Linux processes the
> > > notification, it sends a SET_IRQ_TYPE message back to the remote system,
> > which then unmasks the interrupt.
> > 
> > This is the kind of information that should be part of this documentation.
> > 
> > >
> > > Thanks,
> > > Shenwei
> > >
> > > >
> > > > 2) We are carrying virtio-gpio messages on top of RPMSG and as such,
> > > > this whole protocol should be about thar:
> > > >
> > > > +------+------+--------+--------
> > > > | 0x00 |       payload         |
> > > > |  Q   |                       |
> > > > +------+------+--------+--------
> > > >
> > > > Q = 0 requestq
> > > > Q = 1 eventq
> > > >
> > > > The "payload" part is simply the format of the messages as found in
> > > > the virtio- gpio specification.  From there, the only thing left to
> > > > mention is which messages are not supported, i.e get line names.
> > > >
> > > > > +
> > > > > +- **line**: The GPIO line (pin) index of the port.
> > > > > +
> > > > > +- **trigger**: Optional parameter to indicate the trigger event type.
> > > >
> > > > Not part of the spec - remove.
> > > >
> > > > Given the refactoring work that is still needed, I will not look at
> > > > the implementation.
> > > >
> > > > Thanks,
> > > > Mathieu
> > > >
> > > > > +
> > > > > diff --git a/Documentation/driver-api/gpio/index.rst
> > > > > b/Documentation/driver-api/gpio/index.rst
> > > > > index bee58f709b9a..e5eb1f82f01f 100644
> > > > > --- a/Documentation/driver-api/gpio/index.rst
> > > > > +++ b/Documentation/driver-api/gpio/index.rst
> > > > > @@ -16,6 +16,7 @@ Contents:
> > > > >     drivers-on-gpio
> > > > >     bt8xxgpio
> > > > >     pca953x
> > > > > +   gpio-rpmsg
> > > > >
> > > > >  Core
> > > > >  ====
> > > > > --
> > > > > 2.43.0
> > > > >
