Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADABC2AE77;
	Thu, 22 Aug 2024 18:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724351123; cv=none; b=MS28EHAuZdsJEaUscrmEvOqQcmeO3Ilu5BWDbu7wQLe7VfEYKXslrvmgvH56QFYEhHSVMmZF+wuTmu1hvNnYWEXzr1yu1A5H3OrQPhgVFTWMbdtlq3Vdh9Z+G6CDIM009TU18c83lbWOMIncqeMqyFiOM2WaQZaw2WyMZZ8V3ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724351123; c=relaxed/simple;
	bh=d5SxwQXp9IhK4Vqaj8bbSuKXGNiP1rcA5S9sV1iqwyM=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=jmG56IrgSeSIuJ1PfG+U+IXWN104CpjmliybWhl9og4jKGGSA8095Dzke60789vL+URsaai6ARBS/DbqszeHuZOILCeJMrrAZQU0odZvZklBX7zF5ZfJi0SmaXfmyygBYoeb1WElzjwQ80emQlxx5ymi+q5nhqUXZVsWJXxerkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hp6PetVH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hp6PetVH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEDC9C32782;
	Thu, 22 Aug 2024 18:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724351123;
	bh=d5SxwQXp9IhK4Vqaj8bbSuKXGNiP1rcA5S9sV1iqwyM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=hp6PetVHW09spfI6vqrH0HD/2lrD3vzayiGkJ4liiE6JmEOhI5KDDdt/w1Y7vUUeD
	 TlqM+WZgoY+fw+9pX6RGLCAGL9MHBK1N2Nm/boHbeDc8X0FJ7KFxsAp9Ts8+87+lhr
	 z9isTyFZ6fZoUGTyFWL+d/4mQq16nRNjJ7y6baIUe8OUIwpHB5v+T8PkwPtBJuUn1N
	 A3fkAEMHIcitbnuvG5o4LXPf7TKbgTTDWqJpGz5LXiHTU8i44pL90oYXbtCuHRHDfl
	 jE9fE3jPZMcz8lx+RxGpdhLx4oq+uJGdWSdb+zzrnVJFwB846kBF3BSFZeT6erIUE2
	 Oz62C8couXaTQ==
Date: Thu, 22 Aug 2024 13:25:21 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Cc: robin.murphy@arm.com, devicetree@vger.kernel.org, 
 Hugues.KambaMpiana@arm.com, linux-kernel@vger.kernel.org, 
 liviu.dudau@arm.com, Adam.Johnston@arm.com, mathieu.poirier@linaro.org, 
 sudeep.holla@arm.com, Drew.Reed@arm.com, linux-remoteproc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, lpieralisi@kernel.org, 
 andersson@kernel.org
In-Reply-To: <20240822170951.339492-2-abdellatif.elkhlifi@arm.com>
References: <CANLsYkwOrtXxObL5MKf30OrUYB_uT=DnGEXUtfjH503r_LyMQA@mail.gmail.com>
 <20240822170951.339492-1-abdellatif.elkhlifi@arm.com>
 <20240822170951.339492-2-abdellatif.elkhlifi@arm.com>
Message-Id: <172435112119.3486691.3093277909404901548.robh@kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: remoteproc: sse710: Add the
 External Systems remote processors


On Thu, 22 Aug 2024 18:09:47 +0100, Abdellatif El Khlifi wrote:
> Add devicetree binding schema for the External Systems remote processors
> 
> The External Systems remote processors are provided on the Corstone-1000
> IoT Reference Design Platform via the SSE-710 subsystem.
> 
> For more details about the External Systems, please see Corstone SSE-710
> subsystem features [1].
> 
> [1]: https://developer.arm.com/documentation/102360/0000/Overview-of-Corstone-1000/Corstone-SSE-710-subsystem-features
> 
> Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> ---
>  .../remoteproc/arm,sse710-extsys.yaml         | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.example.dtb: /example-0/syscon@1a010000: failed to match any schema with compatible: ['arm,sse710-host-base-sysctrl', 'simple-mfd', 'syscon']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240822170951.339492-2-abdellatif.elkhlifi@arm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

