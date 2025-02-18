Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC2B2862A2;
	Tue, 18 Feb 2025 21:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739913122; cv=none; b=WSA3USMjqgtwUGs1Mn638rwTyuKR8gezZyJ+c9Djw5ibDOCvoxYl0qRJzh7eimJCU+hIILMFe9ivSCT5G4vhEFC2f6q/30hAVyLyeU8+skWwrnwAd2pLLWKYb+VNRQFqMaEJBLCie6I39UeY8Tw6U2XWkyA6AT30TL5VVfyt+8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739913122; c=relaxed/simple;
	bh=OTxnb6SXacyVo1Q7SBxbvVscuy14TZzGqRxzd1B2ZyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ujc/sSUMdozaFKjQKygNeR9Ak0n+HPkj+X3IG5BkIZJm+txpqM1M0YouKikTAfAnsdyRBOb3yjCl4hV66W+WSmHS7kok2ITUXzuLYkRy9+jdwBQvsI7oPrXKGuE4mpQKzQEHCv4T+ylQ0OEsJ91IWXbCOl9hAdveyQp7GqUSkUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dIk1IVgR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dIk1IVgR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF5BAC4CEE2;
	Tue, 18 Feb 2025 21:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739913122;
	bh=OTxnb6SXacyVo1Q7SBxbvVscuy14TZzGqRxzd1B2ZyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dIk1IVgR4ivS4+m2fiDyB3CHu0Xy5vOwJUmA1Vwr1pWNGaw8EzgUmcx+jYwiLnY72
	 gf9IKiefw6/EJulqEe1FUS1uVGyrq2OeA8ogCCUGdDIRDqybeP0Edh9gTjYdh+Cmyt
	 q7++61gHWKamEvNPd0jgtgTiwQNQ+dsD/GVU9+82/4e+Xajg/V4xbqBAyUemY6dA2q
	 zGt4SpwF59jdpCUP2yj5yhKkzEfBcqHNqhtTZTO5IrdMUR7IxqqyPJrSsuyX4E2fLo
	 /gRbMTMlm38mqWB0Kc6/HuMoHTZG08ZovOOVKX8BhtLM3+pFE1GqfSI7LFTsqIeCRO
	 Bd3KXm8iPXQVQ==
Date: Tue, 18 Feb 2025 15:12:00 -0600
From: Rob Herring <robh@kernel.org>
To: Siddharth Menon <simeddon@gmail.com>
Cc: devicetree@vger.kernel.org, andersson@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, baolin.wang@linux.alibaba.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: hwlock: Convert to dtschema
Message-ID: <20250218211200.GA991534-robh@kernel.org>
References: <20250218161352.269237-1-simeddon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218161352.269237-1-simeddon@gmail.com>

On Tue, Feb 18, 2025 at 09:39:35PM +0530, Siddharth Menon wrote:
> From: BiscuitBobby <simeddon@gmail.com>
> 
> Convert the generic hwspinlock bindings to DT schema.
> ---
>  This is my first time converting bindings to dt schema, please let me
>  know if I have overlooked anything.
>  .../devicetree/bindings/hwlock/hwlock.txt     | 59 -----------------
>  .../devicetree/bindings/hwlock/hwlock.yaml    | 65 +++++++++++++++++++
>  2 files changed, 65 insertions(+), 59 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/hwlock/hwlock.txt
>  create mode 100644 Documentation/devicetree/bindings/hwlock/hwlock.yaml

The consumer side lives in dtschema already. Please add the provider 
side there too. Patches to devicetree-spec@vger.kernel.org or GH PR are 
fine.

For the descriptions, you'll need to relicense the text in hwlock.txt to 
dual GPL/BSD. You will need TI's permission for that.

Rob
