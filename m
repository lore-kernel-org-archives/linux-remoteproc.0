Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05E737C0F7;
	Fri, 10 Jul 2026 18:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706847; cv=none; b=atD/cqILollJZqHxyzVjfoajDmSLcvfjOALaUHh/WhA46KxOgIKstIrfM3xfhu9xrtaXG52vKC9vfImQTR63b0bDyQQCS3aJeZoDNQR64TVeJvqDw/okbjeKbF/neuhFojH9Yew+VEhN4nJRIcB8dA1ILwJEKwqyxp/01/q60rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706847; c=relaxed/simple;
	bh=eAITFPOCEuW56hJol+BRhwmU47JapVeAE6fdtHRutWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PbdmgIFDw6/Eigr9EPbbEmD911alVCpm6PGy6ALksf6eT9Xxm0KdXGmNZw0Zf8mK33AmUvM+xAaBVJ//niHksiIxlzrJy1pIRFkaFmss8cuVoXaa6v5fgQpkZXTYT7qz3ofRbMBKj0JUkcZXNFf5HZ+mY4WkDNU6JiD+BvAf2QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nv/sA7Mc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nv/sA7Mc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0D81F00A3D;
	Fri, 10 Jul 2026 18:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783706845;
	bh=EFkeIeU2FBGbEqfcB14GA6QRcO1JY2uvLVTQLi5eGUU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nv/sA7McvirQ8iJD+fR1bLLLazEgXdvuEpdtkHhcl2rUVUwrl6VHvYdddrb0PMH5J
	 n/40Ffim08ig/rcuOQhq0pt1iOaz7JBOpu1OB1ks9yCCgqAP/Kl4WNKNvA8zoMru+B
	 nKMcHOGBW+Rpf8oTizPXN42+nSsGXQ0bmG4lMF2O4mWuMoC35SRSviBBHMiqcMp4W1
	 gls4lv4dt0Y/1pvI5pHR4Ag2/dF5aL7f0E3vatZw+xViWr08HyOwXeg491vocBMoR6
	 3PGl9s9feCv3+8tfyOb8KSoRTir0tSPLsFEEeyIJmihBr2AsyyGdNvmTX6MTX8Nfpb
	 Sy6kyPbMrIe+A==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ohad Ben-Cohen <ohad@wizery.com>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] hwspinlock: propagate errno when registering single lock
Date: Fri, 10 Jul 2026 13:07:10 -0500
Message-ID: <178370682988.2572738.9921265128936208294.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260512084856.30497-2-wsa+renesas@sang-engineering.com>
References: <20260512084856.30497-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 12 May 2026 10:48:23 +0200, Wolfram Sang wrote:
> hwspin_lock_register_single() always returns 0 despite checking the
> result from radix_tree_insert(). Propagate the errno to make sanity
> checks in callers of this function actually meaningful.
> 
> 

Applied, thanks!

[1/1] hwspinlock: propagate errno when registering single lock
      commit: e088ffa9a00eaaaf90da74763e774ca160969c26

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
