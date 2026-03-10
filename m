Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FAE36C0D6
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773137017; cv=none; b=JrB0Ydv2fVUt5hdtdYiLRHWdul22JuNOEPFXa7hvRfVa513F9+ZrJfWBZMXIZ7aYF/4qRPbiIEfiAsYCfIHNuB7/jcN0bZaAhXR7JkzXGAYuE9pQ/e6JNok4Yzw2OfpRns70tmnlcbqmfJbFyKi+J9q74H58hKG6S6GOpI41vFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773137017; c=relaxed/simple;
	bh=ObvKi9NaY7+uPMYxFs24AME6sXp5oH7cru8lGbIE6BA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4E/Bz+kBfc35LUkOpyDVZicZc1wkty7nmu5BB1yZvi/kuCYlsRelXfYWMx/Cal5++Cg/7u0xI6Pp7y4+4u+6I4STJ6/z6SzK5ai4sl4ivgllHRSusWvq//zGvQXVFULaSZCWY+6QA6UsuSHB20VFHf3bCS5Fe8dn1hYfHn/v0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IvVQiKD4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IvVQiKD4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ayV8
	BCyf2XoDInYD5LQLPcn3jxd6CB5g4EREMmVVmUk=; b=IvVQiKD49JJr2mO8MnCm
	HNkjuXFc2q+FvRrxrIZVB3o4Y1HsKbz8tYvQdg54JveB+oixMwKDvo6BEbIGi5rN
	3lznh4JHMBi7e2LG/MVw/gaPWn1eGfa2mak79JsNkGmmAKVKqwV2WFwuTqZ/Y3mN
	NBy2rEmoFAT5DXAJomjfU+4qICRRQpHwA8awAfKdIvTnf4ClS2pflah1YRvJJsMo
	cMHsi6Cxo9JHrDe9CCDHjAWHTT9M4s14TM/+zAVwAnaFu5sL2vJSn1NhTsDcQS68
	5uZvwO+f0jf7ZMPSIzLwjFLZwf3pmQPXJDoM0CuEwI9nWjv55YuHKsQacyODcqqY
	cQ==
Received: (qmail 3159956 invoked from network); 10 Mar 2026 11:03:31 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Mar 2026 11:03:31 +0100
X-UD-Smtp-Session: l3s3148p1@cv2poahMaoogAwDPXzF+ANZpdrMKUeLI
Date: Tue, 10 Mar 2026 11:03:30 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 09/15] hwspinlock: sun6i: use new callback to
 initialize hwspinlock priv
Message-ID: <aa_sckE7C3kwqYxb@shikoro>
References: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
 <20260310075539.11701-10-wsa+renesas@sang-engineering.com>
 <CAGb2v64gTM41Q3aBkS+dqJ7w9fHtePte-6jeoFR3j-O1_aX9-Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGb2v64gTM41Q3aBkS+dqJ7w9fHtePte-6jeoFR3j-O1_aX9-Q@mail.gmail.com>

Hi ChenYu,

> >  bank_fail:
> >         clk_disable_unprepare(priv->ahb_clk);
> 
> Just a note, I see further code savings in using the clk and reset devm_
> helpers. I'll do this after this series is merged, as the context overlaps.

Yes, I saw this, too, but thought that this needs HW for proper testing.
Great that you are up for it!

Happy hacking,

   Wolfram

