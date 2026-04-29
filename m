Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547C62AD0C;
	Wed, 29 Apr 2026 04:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777437182; cv=none; b=dX+tVplc2dvEjMRQCtPGlq26sMx51yOwyBIODyGZKOAprYBHBYLDJQibjt2IeopXOVSg71U0y9Wy5aSIi0cwDRyDv0wZgvOLMZUL9VDH1KrPrh9U3LPAm8dU6Iuq+SL17K5Nx8Fj/UZ818r0iH0uibFx5yqdt2d+A3JBMWEc2FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777437182; c=relaxed/simple;
	bh=zL4sgyuJMxIsM2E2dtPOAZjNBTFqu4lmyQnSOXu4cHU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=kF6OIrwQ7ewSdv3YO2SWrvOdCNosvjPT3w6zK3ar+VITNFEwcaS7F57yIVwM7lEvrLLqNWCg19hN3qBcpoD1PeB1jjArg6tGdjNzdII1jaM6OIUg8RAbFIhwEn2MbzI4qvEk1V90FrFDE3KzPTkS3qdx5yQKNfMazHKTk4QIfuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P2PATKTG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2PATKTG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04192C19425;
	Wed, 29 Apr 2026 04:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777437182;
	bh=zL4sgyuJMxIsM2E2dtPOAZjNBTFqu4lmyQnSOXu4cHU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=P2PATKTGF+1qIQ2DmnHxv66NG8Lq++QfeuVie9RJG+XQby9F+tsEleIRWhaphKwE9
	 Rh6dG9WJjUsH6hILTBAYHUjPCCoQbJ3yiVQuoxU/VsPU8mBGzy5GLNKTsOcK5Zy36K
	 /YSLfqW/9LzQYmA/VOCtvfnJZmUkCR/xpKwolTo4bDQl4nwOfmFzWWVXXNwWV2X+gf
	 iRYcYBG/ojU9SA7BZMDgKQZjF/JTQ6nQVjJsCKfDH1/7+oL8LPs4LKQwJVo4PRJQmO
	 HvK+fo2NBY1ixC/Pv23AYHQHBwal1zRQYjuUsHCppLprXpGDVeVa0NPZp2IpgCBv2v
	 hG3UNwWjDX4eQ==
Date: Tue, 28 Apr 2026 23:33:00 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: imx@lists.linux.dev, peng.fan@nxp.com, mathieu.poirier@linaro.org, 
 mingkai.hu@nxp.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Zhiqiang.Hou@nxp.com, festevam@gmail.com, kernel@pengutronix.de, 
 Frank.Li@nxp.com, linux-arm-kernel@lists.infradead.org, 
 andersson@kernel.org, s.hauer@pengutronix.de
To: Jiafei Pan <Jiafei.Pan@nxp.com>
In-Reply-To: <20260429031047.30893-2-Jiafei.Pan@nxp.com>
References: <20260429031047.30893-1-Jiafei.Pan@nxp.com>
 <20260429031047.30893-2-Jiafei.Pan@nxp.com>
Message-Id: <177743718015.3571544.12237368801599782841.robh@kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: remoteproc: add imx-rproc-psci
 binding


On Wed, 29 Apr 2026 11:10:43 +0800, Jiafei Pan wrote:
> Add compatible string "fsl,imx-rproc-psci" for i.MX Cortex-A Core's
> remoteproc support.
> 
> Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
> ---
>  .../remoteproc/fsl,imx-rproc-psci.yaml        | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml: properties:fsl,cpus-bits: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml
Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.example.dts:8.9-16: Warning (ranges_format): /reserved-memory:ranges: empty "ranges" property but its #size-cells (2) differs from / (1)
Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.example.dts:5.21-14.7: Warning (avoid_default_addr_size): /reserved-memory: Relying on default #address-cells value
Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.example.dts:5.21-14.7: Warning (avoid_default_addr_size): /reserved-memory: Relying on default #size-cells value
Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.example.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.example.dtb: /: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.example.dtb: /: 'model' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.example.dtb: /: '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.example.dtb: /: '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.example.dtb: remoteproc-ca55-1 (fsl,imx-rproc-psci): fsl,cpus-bits: 2 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/property-units.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260429031047.30893-2-Jiafei.Pan@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

