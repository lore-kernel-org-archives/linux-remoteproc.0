Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66DB373BEC
	for <linux-remoteproc@vger.kernel.org>; Sun,  7 Jun 2026 14:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780844248; cv=none; b=IQwGmJ2ZLPVVHLBUCTX4+Oy8wNTY6Rw33oVdpC2GM3sxVLHNxjj2QfQR1/132gkPJ5UKF7k5keqNK4PozwyMq/6WOQHvJA2Oh+ZoBIJxdiBQtdKu4aEHzppcOHcZbg9CoVS3B/crPhotyFSvm6RKEqMO1GPc7VbApSMmGUUp30M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780844248; c=relaxed/simple;
	bh=ZtqC+qnofvrCmCjX+K7HBaQPUaVjjEi2PlLXZ9QOs3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9sAxaQjm1Pm9HU9yPApLGf2lUlb343Jgkf5NEDRPL7Se+CGkpjYKq+CwrexfUFN7zJnuB8o6ppxXtdeB5u7xW2y65R6U31E+2dJXsZ/y6cBIdxSTMwgPAH7MS/nqVYpf7xHviWRwz83H/EcK8wFIPTxCqLJ1Mms3ZL/oV+n+fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=e0StwP3U; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="e0StwP3U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ZtqC
	+qnofvrCmCjX+K7HBaQPUaVjjEi2PlLXZ9QOs3U=; b=e0StwP3USm72zyvo2mQU
	YcHKr5/+CFQI2aKUNnf7qjdFK1HwL4d6INirsC0FkSENYKu8NxGVPaEu5tHsbfGA
	OCUcK25hBpWATPhRO7dix+lZ1Hge2swcF5GdaERhcwfGq71RoURu6tKz7cGzgczv
	E4Aq9NooUaf/ZgZHBDJqrEBfCzOA7zUbzazjxd+Ahi/sL4L+k53/J/88uCn//EfQ
	soOWQdw9cRVk1vNLPCsY7lVuqF7vdnbJFx3Rh9LX6/NxhE9zF309f5TgnRiQJHRk
	9u/4EIFtbBDZYcPauHG3gf9XE6UBznzg0DvF4d8suH+14Dre2sI0E1NGZiK/Rw6p
	Dw==
Received: (qmail 505574 invoked from network); 7 Jun 2026 16:57:15 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jun 2026 16:57:15 +0200
X-UD-Smtp-Session: l3s3148p1@Eq0JHKtTCyRtKXG8
Date: Sun, 7 Jun 2026 16:57:14 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Ben Levinsky <ben.levinsky@amd.com>, arnaud.pouliquen@foss.st.com,
	daniel.baluta@nxp.com, peng.fan@oss.nxp.com,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Tanmay Shah <tanmay.shah@amd.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 0/5] remoteproc: cleanup shared carveout and
 resource-table helpers
Message-ID: <aiWGyj0KJ5I3qB2U@shikoro>
References: <20260529021637.2077602-1-ben.levinsky@amd.com>
 <ah2aVdlsLqy9aeHP@p14s>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah2aVdlsLqy9aeHP@p14s>


> Wolfram has already indicated he wanted to test these changes - Arnaud, Daniel
> and Peng, please do the same for your platforms.

Testing is more involved than I expected. Didn't work out this week.
I'll keep trying for next week. But it may end up the week after that.

