Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EA3410D15
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 17:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777484013; cv=pass; b=HPUnsO+g+2xH6i0hZCAzFqPCqWT1W8XtKIG13UaIz2GEQro147gZHbQsBCSbNtRuGMTW2cZrS+OazzADzuuN9AF9VPO1a5OybMJxFZuNLOcMdrhhyhQi4cJ26EFa7oQvA89dB2yTGbXFjAbFeoP6u1BaKOEfLUeLYYWSSbek0VU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777484013; c=relaxed/simple;
	bh=kN1Jg8zrE0WkiYysXn+g0/IiPU/u/Efvo6UZbhbtzTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pZ/MGVQYlNhntBbfRxlJ6aFlgf+hGZR05nE1mg+zzwVBZA6c2pj7FDAoay/ElqInrZgEiJYDegAEB+a39zYsISkvTZCLj71MW7frlHwXTDyVcUr754CkYHtn2YSiZVgrxvlYZU1jNAhjJ9Zsf0mhXO39nf6tIE08uUeJHAxLAuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PEKrzCC/; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PEKrzCC/"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-671ab90fc1fso110185a12.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 10:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777484010; cv=none;
        d=google.com; s=arc-20240605;
        b=EMRP7IwUWGdTjQVZhR9vCLPfuu+FWKe6MfHKGZ4tGCkbIS+iCDz+z3xWe8XtVPkBqe
         KWiBD2SJJm++uI12/Gz5vk6kCpQrmMYr5BvXO4DQyYPNlDQoKiIHA2zXzDh7ziTvrWBc
         7M6S6+td8rglLmvPZFozqviCf+dtZCp33PZjhpuHA1ul6KRNc2rJPUI2SHjXdkPE52O6
         aIetnV7PvDrETQQkI4Y6ZooVKakn4i4xW/zBgz3I6RmqlqwUeUFUMWFfkatQQvqdBtCS
         gRiRWGjAjSaAfLaz25DQfiSzJDhy01Se17F/dwtKLxU612Rn3QgrLEnlLw54d/puWFGw
         SQxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/kb5CXOOm0mj4ODKw/K4npAFTtH0bYa0bnYZ1mb4DgI=;
        fh=YdYFE7m1NtjnrBjj7Hpyk3m57fXLl5nKN8qL30HTkB4=;
        b=BUlUxZu4UoxjD7rMOMmmzOF0cPPAn8YHzyZexd0XKLKQ4L1afF+5qEJpmeRWDgzLAe
         QKi9GuT0uqLskkUYo8X2ftTAHZkJW/8Uh40YvqJ9W6IKIa9uSGY243Wn7ytSs9eU5BkE
         CyL2fsg+Y5SknQrBTkjLwAhXqqxvCf4dTPuYv7jjv+oA2fwfSxvcAabAEn/EggigjAzA
         eE00mFOhYYWohm+xyUR8tRkeA+4hKY/iUCC36D1hZn14ZjTtlgrTEIjeye9O1duuY5W5
         4IiBS3t+Guia4FAyRo0aCAfL0I4pntcAxVCaR3OBL/ZTTiIc9ypIMa4I1KgafTlvggJb
         KMlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777484010; x=1778088810; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/kb5CXOOm0mj4ODKw/K4npAFTtH0bYa0bnYZ1mb4DgI=;
        b=PEKrzCC/rAYDBGbkyjxCwRTqVSUmwyhWncEDGEJDD1tfT5AzME3HRihUbthWq6pyp7
         QycNd14wHmXXNN4jxEJuyFaSq0o38AsPNg5DRuCjwju8yAj+dHEc5XA3z+AOik/nGGFV
         PDb5YwnzrlCwoYLc4vYEYt8bxJOeIFByHRSmhhXVCB7oQ/GbdX0I9UeL/bv7mhXQri8i
         gjprCCsn+XGTdBgqVKYQvvzUE5ujR0ETrdAn/nn7Rpy9ZbsyZ5UUHHoya8VBKoH+tUWZ
         oLZq+y8E9nwRapDuGWGykFWfM1s5u9sPt7k1ygv6klmBTPlahP7K493EyogU3Qa68M07
         NlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777484010; x=1778088810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kb5CXOOm0mj4ODKw/K4npAFTtH0bYa0bnYZ1mb4DgI=;
        b=BHz17kpEz+Zw/3t6dMGcFXD5F0wV15XTwRgJn1aWmhqNhBWn+feQBmdSXObsdK2rbq
         Mmh1NhdT76O5o9E+9U3CKI41emawD0UUyJascObOSMFcq3cI3HAcnCSM24WoES1R2rEg
         qtC+BBxSOgih55ziYxKpf546f3hQFvgJTt9rJQF3EbpGEWH4K9gIZWTV35JxMYXUheXM
         VTYCAJnHE86Pg5qWX/Ypglu2q6ABbKShh1aLOuqZ1oh1yK4Clr3ax9ddnrS+QwNF5iZp
         1PEIQG9OYk/54fNQ9O8C5a9PjtnknbkJsTKpBHpcthU8fbASFHBrKMpieTsQVBFZkDGL
         S0OA==
X-Forwarded-Encrypted: i=1; AFNElJ/RIfcb+Tz1KY/lPpj+NxJbNAGpfOVA+oRshRsPXXld7U1TidFPwwf4hieRt5N61oUAr1b4fjeHs5T5u86mUFbn@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8ffZFIDJsdvO6rmSN5K9w/nJm+tEi4fjONdCpwAgpCTmfZVay
	jQF6Mi7bLweRVUk67RfT5rK7bTJAzFkSECPIeqVeQickiPdINgRKmSzjvgr3lnF2ehjM3ZTnNrn
	v9NvRsPrIb8xmn4+f9XBKZzmoudtucAHkolCjUHIgag==
X-Gm-Gg: AeBDiesrWVfHzfyJMpEZ57Huiamg1ePZJtVoekAKKnKOE8HZwXgHl7Hd8DTf1TmrEOk
	tjZriWpT1gZx+cQTZgJOyEl62Wbkd7BdWJ1q94WfpoH11L2oppPwRbI3QYaaSfSnCTXvaMHIIE0
	41ge8WjF3tNRg5dXvs24um+JgpV9cE1hTLaDbpC+JUP8FuztfYPgV6TkzwvWtE+EewV+uj2/uxj
	yzv2HO1oLfdAOml5b/TV4mcpr+X6K9cmoyWotSk7MXSbzUCcSBhXjZOJ1qOQy0xCdjrWgHH+vx5
	1/qsKAVWae9M2A2aV0ilFG/AL45bUgZnnLhR3Wh0fRJoPdXDR/H9
X-Received: by 2002:a05:6402:1ed3:b0:672:5255:af77 with SMTP id
 4fb4d7f45d1cf-679bb07ee71mr5034063a12.13.1777484010328; Wed, 29 Apr 2026
 10:33:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com> <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6412a758-4560-4cf1-a0d0-5b24d1a715f1@lunn.ch> <PAXPR04MB9185009A17DFDF3D6C8B44E789362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6e01e114-e336-4744-b6b4-563ec42e321b@lunn.ch> <PAXPR04MB9185A098D894B6A6EBCC13F889372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <afImuoeHolxGgw3H@p14s> <PAXPR04MB9185F2F6DDB55AC56C92D63B89342@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB9185F2F6DDB55AC56C92D63B89342@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 29 Apr 2026 11:33:18 -0600
X-Gm-Features: AVHnY4KBveuXaT50xXGT561BJAnz_p9YSdb7SJnI5b60PkMgL6_ZMJ8SGU0KF-U
Message-ID: <CANLsYkwvL0Z3+12MD=J+Dc2yAU2T8ypizyG=6AhYoWOh55odHA@mail.gmail.com>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "Padhi, Beleswar" <b-padhi@ti.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Apr 2026 at 10:53, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Wednesday, April 29, 2026 10:42 AM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Andrew Lunn <andrew@lunn.ch>; Padhi, Beleswar <b-padhi@ti.com>; Linus
> > Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
> > Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> > <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> > gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> > devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> > imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx <linux-
> > imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
> > Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
> > On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Andrew Lunn <andrew@lunn.ch>
> > > > Sent: Monday, April 27, 2026 3:49 PM
> > > > To: Shenwei Wang <shenwei.wang@nxp.com>
> > > > Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij
> > > > <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
> > > > Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
> > > > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
> > > > Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> > > > <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha
> > > > Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > > > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > > > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix
> > > > Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > > > <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> > > > devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
> > > > imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
> > > > dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
> > > > <brgl@bgdev.pl>
> > > > Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg
> > > > GPIO driver
> > > > > > struct virtio_gpio_response {
> > > > > >         __u8 status;
> > > > > >         __u8 value;
> > > > > > };
> > > >
> > > > > It is the same message format. Please see the message definition
> > > > (GET_DIRECTION) below:
> > > >
> > > > > +   +-----+-----+-----+-----+-----+----+
> > > > > +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> > > > > +   | 1   | 2   |port |line | err | dir|
> > > > > +   +-----+-----+-----+-----+-----+----+
> > > >
> > > > Sorry, but i don't see how two u8 vs six u8 are the same message format.
> > > >
> > >
> > > Some changes to the message format are necessary.
> > >
> > > Virtio uses two communication channels (virtqueues): one for requests and
> > replies, and a second one for events.
> > > In contrast, rpmsg provides only a single communication channel, so a
> > > type field is required to distinguish between different kinds of messages.
> > >
> > > Since rpmsg replies and events share the same message format, an additional
> > line is introduced to handle both cases.
> > >
> > > Finally, rpmsg supports multiple GPIO controllers, so a port field is added to
> > uniquely identify the target controller.
> >
> > I have commented on this before - RPMSG is already providing multiplexing
> > capability by way of endpoints.  There is no need for a port field.  One endpoint,
> > one GPIO controller.
> >
>
> You still need a way to let the remote side know which port the endpoint maps to, either
> by embedding the port information in the message (the current way), or by sending it
> separately.
>

An endpoint is created with every namespace request.  There should be
one namespace request for every GPIO controller, which yields a unique
endpoint for each controller and eliminates the need for an extra
field to identify them.

> Shenwei
>
> > >
> > > Shenwei
> > >
> > > >        Andrew
