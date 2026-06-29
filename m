Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404CD35B136
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jun 2026 10:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730541; cv=none; b=Q4FKFcKLrHfhH5JW4VarwhLPooswr38jrvx4BDsxpNZIXTLl9xnsDdK+73gR7RMEWHfPdxVVLvSnIfCAvFUg50jMaMwzMXEE4p9jm2ZRT/ju+WCDCkq1lRGBljOZthRjI8iuZhjSPXCqhY9ZJ7m/mfDMmC7CCGUJ12NlrAL3R8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730541; c=relaxed/simple;
	bh=XKfimtIR+il32u0UDPqnf5oheier5kQZfQrahbFYCuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wkh6xJtN1xbLrisrtqMU/n9cHseHfP44KGc82IQTrpT0fwqe71MFh0VOKbFkiHF8tsy3P/YCvWQ95oYdHgybFvZ9cLB/+pdKVD5HpleNh31mUGaBD9wPMtkYloL/Rqow7smbH1fncs6X4yPTttGgSRNp9ABNEzObwlyLA8wLGwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DMIFmaxu; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DMIFmaxu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=XKfi
	mtIR+il32u0UDPqnf5oheier5kQZfQrahbFYCuc=; b=DMIFmaxucrIhIz8myJFC
	Rk+9t1Yg3xaxT2lz33GkRKubfLHKCNwaL5Uq+4m9SIFj93Yp8KVoPmux+Uq2szHh
	W6O/7dvMztx0RvzX/tYVFV/uCMYVEds+B0vVhJi67nRUvToeNLuZviANlkDgsiwP
	F+4baShcvu+cWUysUFjI88Quaw54KLIMyuvKaAGC4Kha0Y9arg+wcmFone1CzkTI
	swd544D/BxPYr+Y8ccvKSJpQsy7p13Xeyl4Y5DfL5ivo1MkHmcGtkmBHD1n83LEX
	9ekBuRHQue3oYaNUSnP0AnNPDLeHx4AVrcwi7ONYKNY+MlMUFMigksdndhUV+Jvm
	NQ==
Received: (qmail 347391 invoked from network); 29 Jun 2026 12:55:38 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jun 2026 12:55:38 +0200
X-UD-Smtp-Session: l3s3148p1@6OlzTGJV3ucujntC
Date: Mon, 29 Jun 2026 12:55:37 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Matthew Wilcox <willy@infradead.org>, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH v2 0/4] hwspinlock: add summary in debugfs
Message-ID: <akJPKZIKlZBuUmvE@ninjato>
References: <20260622085204.54248-1-wsa+renesas@sang-engineering.com>
 <ajk_u7TVT-kL8z2A@casper.infradead.org>
 <akIzahjROM4GAlOR@ninjato>
 <akJLmLwO8IGu5KbP@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akJLmLwO8IGu5KbP@ashevche-desk.local>


> My 2c that we should follow the IWYU principle. XArray header is not generic
> enough that we may rely on something else to provide it. And hence I'm fully
> with including that explicitly. That mentioned users simply neglected the
> principle and I consider that as an inconvenience.

I tend to agree, would need some more checks, though, to keep the amount
of patches low enough.

