Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0BB1D7E4A;
	Sun, 14 Sep 2025 21:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757887059; cv=none; b=YgCmCA+Vn8IfmOWifkYrbKJxdqGLrvaAVFviM964kdh0fkd0ZUra+QFoU4GEJfrQuSrsqGkmLNyYvjQOU8cj/Z0ecETZoPwSXIuZiAdWZwdhLMJYZQRfwG6MxWyGe3XrTO8jpfNNnn4o/i8qMXXx2H9kPECDYqe38tk7+3+fIrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757887059; c=relaxed/simple;
	bh=UzomXMO2OVf/W47Q+4CtX5NoW3MYQVWQvopO9CDJOjc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=J+JQgt09/sGyhMJTI1aZZLJgGMCqJDtAvZA620D7e0V+a1mGYXymOIZO3A9FmOx/MHqEzfNSZ7huDzhcQdvgk3p0bDF5DX9VyyO/DpqoSiFKIBcVV69x3ldQbmw1X3aIxp3FDD86vgBiMYF1v3ZemwebeDzMF781C2A/PeTQNjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DIfT072Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DIfT072Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 651FEC4CEF0;
	Sun, 14 Sep 2025 21:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757887059;
	bh=UzomXMO2OVf/W47Q+4CtX5NoW3MYQVWQvopO9CDJOjc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=DIfT072ZUKWuwafbT+XzNyblKmtqMiLwjIe2LsTqvzKFVgkD24Hil6F9doh8y3HN5
	 RBiGg4uRdZK3CtZiPyKr5uVsP6N/LDKF+FzhiurEBJM+4hxaYkS2POFMncjxOiKEIE
	 k8hKs8rKCaxqjEpT+EZAyTbDij3gjHnyvxFxXe5T2BkLt6NhBGurpnWhLp4oppvUZK
	 xLMk0HIWgRlKr1CTpkx6w7zI8YC7HsSBfyDX7rgGRYwdpCJiK3GM7SK7X6oN0X1Fzu
	 +b1HnZhGitHed6KFpMgxJusg5De/AlcTNy8iezumCH1hA1lwQ+X94hSDfgqttsqCSU
	 LNHOBCO5hj25g==
Date: Sun, 14 Sep 2025 16:57:39 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Jjian Zhou <Jjian.Zhou@mediatek.com>, 
 Xiangzhi Tang <Xiangzhi.Tang@mediatek.com>, 
 linux-mediatek@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hailong Fan <Hailong.Fan@mediatek.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
To: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
In-Reply-To: <20250914122943.10412-2-xiangzhi.tang@mediatek.com>
References: <20250914122943.10412-1-xiangzhi.tang@mediatek.com>
 <20250914122943.10412-2-xiangzhi.tang@mediatek.com>
Message-Id: <175788697866.1955455.17302760216827607004.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: Add VCP support for
 mt8196


On Sun, 14 Sep 2025 20:29:24 +0800, Xiangzhi Tang wrote:
> Add the new binding document for MediaTek Video Companion
> Processor(VCP) on MediaTek mt8196.
> 
> Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
> ---
>  .../remoteproc/mediatek,mt8196-vcp.yaml       | 165 ++++++++++++++++++
>  1 file changed, 165 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml: patternProperties:^vcp@[a-f0-9]+$:properties:mtk,vcp-core-twohart: 'anyOf' conditional failed, one must be fixed:
	'description' is a dependency of '$ref'
	'/schemas/types.yaml#/definitions/uint32' does not match '^#/(definitions|\\$defs)/'
		hint: A vendor property can have a $ref to a a $defs schema
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.example.dts:26:18: fatal error: dt-bindings/power/mt8196-power.h: No such file or directory
   26 |         #include <dt-bindings/power/mt8196-power.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:132: Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1525: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250914122943.10412-2-xiangzhi.tang@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

