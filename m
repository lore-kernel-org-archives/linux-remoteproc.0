Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CB921B9C5;
	Tue, 18 Feb 2025 19:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739907997; cv=none; b=ZWmOBS7XJNYhAv8i1cVq4v4N8AYnDkIOWqTZiucGTgAsK2CKU8AlRSD+ilTgSTDfEUKY1FpFxooraGKCglOWOoIxLUPQia2yS0ivZmjZOf/NMO8WU7sHPFWtD76iC/zp+aNba+NEF7VEpXG3PZWRfNRmD4lduf+yxhEyBQCFn08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739907997; c=relaxed/simple;
	bh=jROiT39l6CvRlCWMONJGxr/KbtZsIn1idD5gSA66mQg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=asgdTXfOpUN1saTeLTJucSgbEfYCsKzSw6Wl2NrzbWfoezm63RzD175qhvyNJbbVeZUtho/jjyHyOeSufGydWIqwXJdULyhSqw6NdaHx1qW5WVpPhdEoac3gwn3WvK6tDHHXKafD+JM0cWcEr2nzhrgb/ecRJz1k6B+jwRQWeN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YmEcx+TV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YmEcx+TV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A09D1C4CEE2;
	Tue, 18 Feb 2025 19:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739907996;
	bh=jROiT39l6CvRlCWMONJGxr/KbtZsIn1idD5gSA66mQg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=YmEcx+TVBADM2L0qianN/xIkdVBrmZ+I2+UMLPHJnjmxrfJ8F/DK4z1WJ8Vk6N4bg
	 Vr26TL/GJLRUCltXI/GM3A1c2rBWeL0aSuPh8geJlQI0lnUNlxoaTuvh20Bfqc93+8
	 blMti+iEIX19AyOwaFLTlJanEONvl/HKJFGW82qgkR+1AZhqQhOIS0xHpHjFx5e9nI
	 hCq5zS0ef/Rc8YPRl6pLPNfA8acb+St3Yx2S8Wdfs3/O3S6sM+CAcwPt7ojXtKvY5i
	 NvdLaJu/QiK1FYz63dzarkv3eAhJWnNhyLb8pJ7/UOgjrBz+HpaaqN19/7T6nM1+3m
	 wyRvoJoGTx8Qg==
Date: Tue, 18 Feb 2025 13:46:35 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, andersson@kernel.org, conor+dt@kernel.org, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, baolin.wang@linux.alibaba.com
To: Siddharth Menon <simeddon@gmail.com>
In-Reply-To: <20250218161352.269237-1-simeddon@gmail.com>
References: <20250218161352.269237-1-simeddon@gmail.com>
Message-Id: <173990799563.417538.15695941594741028497.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: hwlock: Convert to dtschema


On Tue, 18 Feb 2025 21:39:35 +0530, Siddharth Menon wrote:
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
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml references a file that doesn't exist: Documentation/devicetree/bindings/hwlock/hwlock.txt
Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml: Documentation/devicetree/bindings/hwlock/hwlock.txt

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250218161352.269237-1-simeddon@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

