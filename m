Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3E4481FA1;
	Wed,  3 Jun 2026 15:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780500369; cv=none; b=E+wMF1fHsL8hHATake1tqIIprivp0HJO/xinMQVr5aK8hzFrY1JcEeAL0eZgW2ezQRAJBTnaQziJpzV93XZcibyagzDBXdk1yTInmCUfYsSXyEl9PgSDU7u7EO6UqQt1jvKyfABfpAqlQomscydZTBPmFLo5vtnuBZoeIt9J3Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780500369; c=relaxed/simple;
	bh=NXUW6xNUxRnjK/Ovcogrbn0IE4OIscTvKrmz8hg3zoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=USPVm3uYVHb51Lv0uZwB1sZBrOTxD/Bd1JhZ114GZsoAbGSTGrAqyJATP6KDNcI4qdafCBdLx7at5Jrbt7HYwDrLGkYQpqzWO7Et1wakM4/WdaEUMtaBG32BBKnWQOqo1C60ioS/lknoTCz8e+QCEvlKwdj+AHpGnuouzfClefc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PD0cQEme; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+ft5H0B0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PD0cQEme";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+ft5H0B0"
Date: Wed, 3 Jun 2026 17:26:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780500365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YUbArMhatRkOlmiQUjI9Tf31kJ/6pDUsEK5wihs/FxQ=;
	b=PD0cQEmeE7cRnI4TGMBwLATUn0Wpc2HlOAAmRmkvN9v2jSSEU+ONmtinEWC55tNXZi2RKC
	NNUl/goguJx55G9f0HaHcCsmrvodbkPJ3KlfjiUJyBdXFEUbMsp6e7Cr0vlJ14VjeGME3r
	E7iLpSd84Y7Onx97sgYEHY94tEuNvxGPCuXIH895uvZL+JiiKvF8NvAswZ3C7Hqvczwsmh
	OiQa0FgfQcM8CUf+9p53KDY5bBNz/y9wUg99ayTaMUFzqrAv4sTih0G2dwCfnA/zyaoNKT
	qqUGdGIC7zHEnz9vGEs5gM7PGIOkllN5P47ZMPydsBDu+dFspYbwzF2SSl9Xag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780500365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YUbArMhatRkOlmiQUjI9Tf31kJ/6pDUsEK5wihs/FxQ=;
	b=+ft5H0B0zB+qvZsgCto8fK+SXf9/FfUhkyg47hx5xXf3vywr0IhNxkux96Y3KdwbQ5kv0e
	7MqVVWsALoFikbCg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2 6/9] mailbox: imx: Move the RX part of the mailbox
 into the threaded handler
Message-ID: <20260603152604.lBbXa3sE@linutronix.de>
References: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
 <20260603-imx_mbox_rproc-v2-6-a0059dc3b69a@linutronix.de>
 <c81d12a8-7544-493f-a947-8f70ad9d409d@oss.nxp.com>
 <20260603132034.NxZoA4pH@linutronix.de>
 <944c6eaa-05f2-437a-88e7-1573b64468c5@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <944c6eaa-05f2-437a-88e7-1573b64468c5@oss.nxp.com>

On 2026-06-03 16:45:16 [+0300], Daniel Baluta wrote:
> I would prefer to add the explanation for this in at least one commit
> message to be there in git log.
> 
> Cover letter is not kept in git history.

You could merge is part of the series. But I could of course add the
rational behind this to the patch where I start adding the threaded
handler and move the TX bits.

I just finished of with sashiko. Do you have other human input?
Otherwise I would fix the one thing I did wrong, propagate the one error
sashiko mentioned. I'm not sure what to do about the long time outs it
complains about, I would keep them for now. That timeout check based on
jiffies is also odd.

Sebastian
