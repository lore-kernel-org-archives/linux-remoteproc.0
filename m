Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2822F42885D
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jun 2026 15:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782747536; cv=none; b=cddK3EtUtOFyEG1TgVpnWvXDWxQ7lNPyGZOUqVk2+EzaZfMUXxmVvh06QQy/7F3+JuLDFBaNg0kJYPyhS4QoCW7jRBQL0z1fpVbmMZ9PcBf1V5lvDj/HD/7glp9JaugjyZGfpwfHlR9ybrZd39aZU/GquEojJKvxvlEGs/pDB8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782747536; c=relaxed/simple;
	bh=qpX5nwhjfk5PB89WPFs3TuXgsuvEAqgf7A1hpYodI5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bwg1zjY5pJspBMpYeKF3XEjAxpYYFrmfZyAy6lRa+1fIPnWXSe+hYzPZbfW+9B4IJhDRgT9b3LORikMelbJSPtZdVlmXfc21XKKBzwc+cgW9WiuJKW7LsQ75pY+53HCEmxv8GWNOQx6z2gi/Cyr3U6Vf/7J/uXY62wfgTFDo97s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=L8ncqY3/; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MPOZ9702; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="L8ncqY3/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MPOZ9702"
Date: Mon, 29 Jun 2026 17:38:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782747532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xvQuqGNPmPlyRSdWWioxiU7bI3gu/asgds/B4e0XcJA=;
	b=L8ncqY3/xXetNeK5HUHfSaGB/74NxHvifmP8+JpEl86VTCaaBHcXL2x6SwuhfBex3A4JZI
	QBCZkSgB2Ux9OInklcPm+lv2HcREm6QQ1EIIKruWIH7rFJmHDMDskJfPIZ/1tFeeAEkaju
	ICKuVN7nTcnHqRfTJsa5eGwTUowk8kpFKVqbeAMKZK579KD+Qi46/9Md0sLO09AXF/UC6w
	zr9krFFYIz6RcWKdNdgJVhx1K+7bTt/W7OJ7hR/2gbO23QRi2+Qda2XWD33yB2ePpXTS9F
	U0leicin5WJpxDI/2QUzWOvxtMuiKyvyv69yOD9Eg27XJGyeHFWDSApe2bqg4g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782747532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xvQuqGNPmPlyRSdWWioxiU7bI3gu/asgds/B4e0XcJA=;
	b=MPOZ9702oQzlDnpr63hoWoRECO5O28yQ6xGWMBRI91d4iZWTkvcaqRmDol2TkRl6YUiB+L
	3gJt5G4VdghH7pCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-rt-devel@lists.linux.dev" <linux-rt-devel@lists.linux.dev>,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: RE: [PATCH v3 01/10] mailbox: imx: Forward the timeout/ error in
 imx_mu_generic_tx()
Message-ID: <20260629153851.C5PbMlm7@linutronix.de>
References: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
 <20260617-imx_mbox_rproc-v3-1-77948112defc@linutronix.de>
 <ajkbUNkn6MSw8txc@shlinux89>
 <20260624074409.5jwpWs61@linutronix.de>
 <aj43FQ7f6juXQ/tP@shlinux89>
 <20260626083416.xbVlbOQJ@linutronix.de>
 <MRWPR04MB12330C5851B5421F8EE723F1A88EB2@MRWPR04MB12330.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <MRWPR04MB12330C5851B5421F8EE723F1A88EB2@MRWPR04MB12330.eurprd04.prod.outlook.com>

On 2026-06-26 09:00:04 [+0000], Peng Fan (OSS) wrote:
> > > If you would like to address the AI reported issue further, you may
> > > update readl_poll_timeout to readl_poll_timeout_atomic.
> > 
> > What about the timeout value? Keep it as-is or reduce to?
> 
> Let's keep it as-is.

The call is
	readl_poll_timeout(, , , delay_us = 0, timeout_us = 10000);

so it will _not_ trigger the might_sleep() splat and will compare the
timeout value against ktime_get() so it will loop worst case for 10ms.

If I change it as-is to
	readl_poll_timeout_atomic(, , , delay_us = 0, timeout_us = 10000);

then the result is slightly different: The clocksource is not used
(because it also works in suspend path where it is gone) and so the
timeout_us value is decremented based on the delay_us. If it is 0 then
it only subtracts 1ns per iteration. So the worst case delay becomes now
10.000.000 iterations.
I don't think this is an improvement: In the worst case the delay is
much longer and if there is a watch in that period, it will fire. So it
does not accomplish anything.

Having something like
	readl_poll_timeout_atomic(, , , delay_us = 2, timeout_us = 100);

would lower the delay to 100us max (which is below the 1000HZ tick) and
would spin for 2us between register pools. But I have no idea what is
the expected delay and if it depends on the remote side.

Please be aware that this series except for the remoteproc/ imx_rproc)
has been merged as of v7.2-rc1. I can still send an update to the poll
in imx_mu_generic_tx() but I would prefer an improvement ;)

> Thanks,
> Peng.

Sebastian
