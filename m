Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96F31AB514;
	Thu,  4 Jul 2024 11:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720093620; cv=none; b=cPYOQa4qM0MvkVeGmvYosZYCqZczvhvgh2FyDYLmeE0YhvmCCS+1EcNe0jOi/q6JA/zEcNxJG7HzYYAqiuXh0MM3c2cy7uYdYThCXWoHgVi+LibVl3FGHB7scL3wGvXlYxF99Ey7LXOweE+CmIWmtUQn+7l636DHtuRaoOGMk0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720093620; c=relaxed/simple;
	bh=ZzjdEOYiQi74Xl8Oe1HIoYpWaQVx43+ymIJ2BdS2yXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bBwo95r6hP+kkygtUn1/gcYm15w0kAfZllL0fX65wC+wi1JlK/V7uxZ33FJ6uxTTbPoit2Bk5gfCFaQhwPaQy/HhgCVdYmi7/SibTpjx6rJZOZwu46CJLDPoqaHcy33r4GUoIIMuLVhrag8xadZDdgaX+vDC/ZUudq8Fpjou09A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=GEDz0Cpe; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="GEDz0Cpe"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1720093608; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=kFAPwFpQW+/4sfB3wXDzgFi5nuHijwnrZKGmyQsAwcU=;
	b=GEDz0CpeyZF5jweENBL86optd1IJFXOcw/njBwYLCdavsLDLSqyfleuPAvquf0kvFgtZVpCSM5HRKTmuUXKFGmt4GiUl4YE0a3IOmsZXmldJvLATtc/E5CC4NtSwZM3NdMST4uI/J1QUjyWzYz7xzxYcbSzR00ClF7VcOg5jDEg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037067110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0W9qikfx_1720093607;
Received: from 30.97.56.65(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0W9qikfx_1720093607)
          by smtp.aliyun-inc.com;
          Thu, 04 Jul 2024 19:46:48 +0800
Message-ID: <e4e9eddb-d5a8-4534-91eb-8dcdad593f5d@linux.alibaba.com>
Date: Thu, 4 Jul 2024 19:46:47 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: hwlock: sprd-hwspinlock: convert to YAML
To: Stanislav Jakubek <stano.jakubek@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, baolin.wang7@gmail.com,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <ZoaJ04kASEs9M4f6@standask-GA-A55M-S2HP>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <ZoaJ04kASEs9M4f6@standask-GA-A55M-S2HP>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2024/7/4 19:38, Stanislav Jakubek wrote:
> Convert the Spreadtrum hardware spinlock bindings to DT schema.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>

LGTM. Thanks.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> ---
> Changes in V2:
>    - fix double space in example
>    - switch to #address-cells = <1> and #size-cells = <1> in example
>    - add Conor's R-b
> 
>   .../bindings/hwlock/sprd,hwspinlock-r3p0.yaml | 50 +++++++++++++++++++
>   .../bindings/hwlock/sprd-hwspinlock.txt       | 23 ---------
>   2 files changed, 50 insertions(+), 23 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/hwlock/sprd,hwspinlock-r3p0.yaml
>   delete mode 100644 Documentation/devicetree/bindings/hwlock/sprd-hwspinlock.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwlock/sprd,hwspinlock-r3p0.yaml b/Documentation/devicetree/bindings/hwlock/sprd,hwspinlock-r3p0.yaml
> new file mode 100644
> index 000000000000..abe11df25761
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwlock/sprd,hwspinlock-r3p0.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwlock/sprd,hwspinlock-r3p0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Spreadtrum hardware spinlock
> +
> +maintainers:
> +  - Orson Zhai <orsonzhai@gmail.com>
> +  - Baolin Wang <baolin.wang7@gmail.com>
> +  - Chunyan Zhang <zhang.lyra@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: sprd,hwspinlock-r3p0
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: enable
> +
> +  '#hwlock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#hwlock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/sprd,sc9860-clk.h>
> +
> +    hwlock@40500000 {
> +      compatible = "sprd,hwspinlock-r3p0";
> +      reg = <0x40500000 0x1000>;
> +      clocks = <&aon_gate CLK_SPLK_EB>;
> +      clock-names = "enable";
> +      #hwlock-cells = <1>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/hwlock/sprd-hwspinlock.txt b/Documentation/devicetree/bindings/hwlock/sprd-hwspinlock.txt
> deleted file mode 100644
> index 581db9d941ba..000000000000
> --- a/Documentation/devicetree/bindings/hwlock/sprd-hwspinlock.txt
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -SPRD Hardware Spinlock Device Binding
> --------------------------------------
> -
> -Required properties :
> -- compatible : should be "sprd,hwspinlock-r3p0".
> -- reg : the register address of hwspinlock.
> -- #hwlock-cells : hwlock users only use the hwlock id to represent a specific
> -	hwlock, so the number of cells should be <1> here.
> -- clock-names : Must contain "enable".
> -- clocks : Must contain a phandle entry for the clock in clock-names, see the
> -	common clock bindings.
> -
> -Please look at the generic hwlock binding for usage information for consumers,
> -"Documentation/devicetree/bindings/hwlock/hwlock.txt"
> -
> -Example of hwlock provider:
> -	hwspinlock@40500000 {
> -		compatible  = "sprd,hwspinlock-r3p0";
> -		reg = <0 0x40500000 0 0x1000>;
> -		#hwlock-cells = <1>;
> -		clock-names = "enable";
> -		clocks = <&clk_aon_apb_gates0 22>;
> -	};
