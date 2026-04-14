Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB2E2F5491;
	Tue, 14 Apr 2026 17:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776187800; cv=none; b=mofPcZjQMvgn2zYOKutSD6M+4/rAwErTypFLZJ9wJRnehIdkWw/DPm7laHfrqjHru+vU44CM7Bip9ryQFnbQa80q/fp7SaX2OkisKrlqRWtHATT/RKmMBQVYyteVyx1lG2IBMamCOfJqpByP1RCgOHgxjceomcOvDcXkjrhV8Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776187800; c=relaxed/simple;
	bh=BagXwJvrlA3A05idgEFLvWukggLCg5SOI/7kkshvYrY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=oPqm2aD17nMcVO7kSozgmcmMkT8T1qRjA/K7v5to4kXNzH4V7ZoT1xzCnFN5EsDoNoJLSj9IszRf5KwUsde3gpKA2GuJt0wU0puYdO91Y+OCf+mIueSnAHRWeY64coV6BefMtGyFkh9chD1zom2+DbFD94xbmwxXnFqNHcdgVIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W/1l1r04; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W/1l1r04"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C4AC19425;
	Tue, 14 Apr 2026 17:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776187799;
	bh=BagXwJvrlA3A05idgEFLvWukggLCg5SOI/7kkshvYrY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=W/1l1r04uNMtYCtyiZ8FpaJDA+T+0O+oKVntyfFcX7K5XI1cfxyWcSSihWI+QFa1C
	 LLgsA//CjVE6X7pVttw+fRSTEDk3+kK0CfdmdK/vGUhKjU24ve1uZqkk4JH9dlUM3t
	 drWC04WrbNCzvg4lWlXskVxx3PuXGrFI7k+rywByS2e+q7o9jkbJ8YUomJ+FyFLwdX
	 UllVOSDPdEle1e57I9ZI/3oTbG+sQoIM7ZWC1ynMfuIVrEbLZSWPlFFSYnDuP6BsC1
	 0+eIq+e5zi3GcL1eHLyuBoacmzRk4T2FCKRkUf4U+UWRSvu4WnL71wfJI17huGXPHx
	 vTz3fJE9Ou3ZA==
Date: Tue, 14 Apr 2026 12:29:57 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: tanmay.shah@amd.com, linux-kernel@vger.kernel.org, 
 mathieu.poirier@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
 andersson@kernel.org, michal.simek@amd.com, krzk+dt@kernel.org, 
 linux-remoteproc@vger.kernel.org
To: Ben Levinsky <ben.levinsky@amd.com>
In-Reply-To: <20260414161558.2579920-2-ben.levinsky@amd.com>
References: <20260414161558.2579920-1-ben.levinsky@amd.com>
 <20260414161558.2579920-2-ben.levinsky@amd.com>
Message-Id: <177618779729.1690720.13461875466322793336.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: add AMD MicroBlaze
 binding


On Tue, 14 Apr 2026 09:15:57 -0700, Ben Levinsky wrote:
> Describe an AMD MicroBlaze remote processor controlled
> through the remoteproc framework.
> 
> The binding models the MicroBlaze remoteproc device as a
> child node whose reg property describes the executable firmware
> memory window in the MicroBlaze-local address space. The parent bus
> node provides standard devicetree address translation through ranges
> so Linux can access the same memory through the system physical
> address space.
> 
> An active-low reset GPIO holds the MicroBlaze in reset until
> firmware loading completes.
> 
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  .../bindings/remoteproc/amd,microblaze.yaml   | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/amd,microblaze.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/amd,microblaze.example.dtb: /: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/amd,microblaze.example.dtb: /: 'model' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/amd,microblaze.example.dtb: bus@b0000000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260414161558.2579920-2-ben.levinsky@amd.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

