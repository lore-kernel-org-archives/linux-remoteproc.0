Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB0534D91F;
	Tue, 28 Apr 2026 06:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777359010; cv=none; b=gVMAxd2mJASSBdtvbVpWMrsLTaYXEqegdCkWCmqvwUamGdiS081Evg0rhEEV2R4+gPVnrIbvM2mMiaQZVADQgXgI2HSZqHYMpaClhq0gp13J2cZPonX45FKrvCptePM7pZWAZgX6Nn9j1eCSkXrvYWcK5/ZNC3OxNAjG4CBKFlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777359010; c=relaxed/simple;
	bh=79LtFykvtBb9LQsNKdvfV+fJqDbeSEcBv8P8YvOR25o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rWJVCSwU6CyLZuBK2A47bvRkouYlfQ7Wtwkm4DT+pgA1TnI+XIHiZb/6iHSstHTMntWKsAL2DXkHuamwZTyfg+t9v3WphKyulGKLXCs3PWjsKXNLNyCv5EqmcphxwfRCWgPaHC9wF2i4yQij+QoPuDGZYNxonG/eBC9hNRXLhIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ghepi+yx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ghepi+yx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5ABAC2BCAF;
	Tue, 28 Apr 2026 06:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777359010;
	bh=79LtFykvtBb9LQsNKdvfV+fJqDbeSEcBv8P8YvOR25o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ghepi+yxMJaPe0HL49fHYNmx34WVzNZW+vyqtPq9ghMrOIrgd/3cv+1czgC8Xk88e
	 90FAHEbrqlcs7Qnpf089pB/OhIM+3ZnkN4eSQWAXk/jpXLM7bgolPrwr17IsRavu0+
	 wZh68QI139E4glanvznQieJVOqJm8rpyQF/Wl09srrKTrsGrvK8nhu/5t39/KWDJVk
	 1mpmgt4UrAbHI8/otcM4bK8P7076d4hl8KTfTbp1y1CzYTjzIcX+anOsM2+Qv+dQOz
	 ldCMR0ztvSmip3ycPLWM2pZBzLlyVrCDDy2uq1uj28LM0VGxOvuv/9uvCTosdfQT0J
	 YoS5fpSa6Xeeg==
Date: Tue, 28 Apr 2026 08:50:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, michal.simek@amd.com, 
	tanmay.shah@amd.com
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: document AMD BRAM-based
 rproc
Message-ID: <20260428-curly-hyena-of-triumph-fc1f4c@quoll>
References: <20260427162703.1644103-1-ben.levinsky@amd.com>
 <20260427162703.1644103-2-ben.levinsky@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427162703.1644103-2-ben.levinsky@amd.com>

On Mon, Apr 27, 2026 at 09:27:02AM -0700, Ben Levinsky wrote:
> Describe an AMD BRAM-based soft-core processor subsystem instantiated in
> programmable logic and using dual-port BRAM for firmware storage and
> execution.
> 
> The binding models a soft-core processor subsystem instantiated in AMD
> programmable logic and using dual-port BRAM for firmware storage and
> execution. The remoteproc device is represented as a child node whose
> reg property describes the firmware memory window in the processor-local
> address space. The parent bus node provides standard devicetree address
> translation through ranges so Linux can access the same BRAM through the
> system physical address space.
> 
> A clock input feeds the soft-core processor subsystem, and an active-low
> reset GPIO holds the processor in reset until firmware loading
> completes. The firmware-name property is optional.
> 
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  .../bindings/remoteproc/amd,bram-rproc.yaml   | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
> new file mode 100644
> index 000000000000..f16657dc0d9f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/amd,bram-rproc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AMD BRAM-based Remote Processor
> +
> +maintainers:
> +  - Ben Levinsky <ben.levinsky@amd.com>
> +
> +description: |
> +  Soft-core processor subsystem instantiated in AMD programmable logic and
> +  using dual-port BRAM for firmware storage and execution.

Isn't the soft-core or FPGA still part of some Xilinx SoC? Or is this
completely different thing from SoC and there is a design WITHOUT SoC
using this remote proc?

Best regards,
Krzysztof

