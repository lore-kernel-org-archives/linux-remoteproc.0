Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15D5238C1A
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2026 16:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782145213; cv=none; b=rWt3gUnrYdpsoaWkFnyYJq1KXtqp1dyCpO84YaVclj1VsekP1wF7/RGxTSg0SBWUjbesiFgAPNtk4K1sldQYpU9lIVWE2M/PJ1/JmDGG63a+WjRUjdSHfEuMxTmxh/VAIzfMAC3QDBYz8QJsF50kCR59GGQlStGVO8pR0yROwPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782145213; c=relaxed/simple;
	bh=v08vXRNGsQyoNz2OBnamN7zvawDR7EWR6KdNDUEWK6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=icpx1pMnX1KpFemtGf7RIUCA8bHmiBdoVmt7BywKh45gODEMm/8TCwjbBUaeTesQQpMhAnIeRn+MceCT5BrNGErIoBrWFRckGEt70/h8nFHZYBSk+/54X+ZmhaiWxSo7l41S877tc3qCLW65H2+x92n8mZVZx+Szse2UjJJ/vZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Y1IY//P9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Y1IY//P9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=f+vj
	9wHvsyBz3hj1KxQXgatWUI0Ybb1TR0D2MIxnwhc=; b=Y1IY//P9uZCa9yRGQ3Vp
	E+Kw2CA7mLzyPkRbsWNwt4sc9Vm1MKPM1TNd4daL27N26hmk6DTzVwNYs44Bmhz4
	s6ZCt/ZnCzVo/kWVDsG5AC18ReFrICYfZAiE0IcnXLQNbChCIKJI8PHtsgrKoBPl
	1/8VsWgfocgnhdI3kqs47QZBNZAVF2S4//bhWg4nG5nndg7JZfbL7wKFnfyJlXis
	xc8hMWLUW6LV+YJFn0cRwfjuLgsC0QW2spFmLv2XXlYvzS9YmKN8ltdv33gC1Afi
	XSSxr3oWDdvOuTdAafw82ECV9WsOsVmQJeOOpASV18cgPL79nrUY9shQTadvcszM
	KA==
Received: (qmail 2038201 invoked from network); 22 Jun 2026 18:20:06 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jun 2026 18:20:06 +0200
X-UD-Smtp-Session: l3s3148p1@8L31A9pUHo4ujnum
Date: Mon, 22 Jun 2026 18:20:05 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH v2 0/4] hwspinlock: add summary in debugfs
Message-ID: <ajlgtWNBWkCxJjde@ninjato>
References: <20260622085204.54248-1-wsa+renesas@sang-engineering.com>
 <ajk_u7TVT-kL8z2A@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajk_u7TVT-kL8z2A@casper.infradead.org>

On Mon, Jun 22, 2026 at 02:59:23PM +0100, Matthew Wilcox wrote:
> On Mon, Jun 22, 2026 at 10:51:59AM +0200, Wolfram Sang wrote:
> > Renesas R-Car SoCs have their spinlocks inside a unit called MFIS. Up to
> > R-Car Gen4, there was only one MFIS unit on the SoC. Gen5, though, has
> > multiple instances and, thus, multiple spinlock providers. The spinlocks
> > are meant for specific cases (AP<->AP, AP<->RT, AP<->SCP...). For
> > development on these systems, it is helpful to have an overview of
> > registered spinlocks in debugfs. This series adds support for that. The
> > first two patches update the radix-tree header to support more lock
> > types. The third patch fixes a missing RCU annotation for the slot
> > pointer. The fourth patch finally adds the desired functionality.
> > 
> > Because the radix tree seems to have no dedicated tree nor maintainer, I
> > suggest that all these patches go in via hwspinlock. This also keeps the
> > dependencies zero.
> 
> The radix tree is deprecated.  I don't want to add any new functionality
> to it.  Here's a replacement patch to convert hwspinlock to use an
> XArray instead of a radix tree.  Compile tested only.

Wow, thanks a ton! I have a conference coming up but I still hope to be
able to test your patch this week. We will see...

