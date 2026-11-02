Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793642562;
	b=03YwnPKrffN34bufmKdY5c/5vp5hjBjDgWQXSHYkDJ86W8kpDZ2AGl4e7aYJNpcLU2Fg
	 sM4X6D8ehvI7WmiwHQdKW5JYmRvozmzeVvEqJyPfd6vvGJLM11QLNDNq2Tora3Fb4MFa0
	 Z/Jn1vePVWrySkuY2vsP1XySHcVBGkMZ01n3fmk6jRfJfYZZ0DNECi4AAgfRx0U4+UAlZ
	 htjjArIcdqc4HhqHeqrx9j7YTd+HA+TU+oKiNqyRf+9/4LWm3hxnVUYuh//lk22aYV7sQ
	 em3qOQLVyqAHfmdqclWcx0HUTpdVVhcA1ncKgY9+nMPEOkY2tE2dARD4aIy7fmHwtow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wjUwlJYpmWg4mChaZqQtsUzChcNIv0kOIN66bk7+k2A=;
	b=iXCJ5FynS5edw7JYGhL1Ief5tJIBAKJOHC3JTr8UM52RRoJDv+rl51dIghi7iIHboJRl
	 sfuMfeixAopXKBJI5kfRGRcijbFrVrKUEcvWjQ3MJOBmd0TAm0j0Bgzx0QVWmPv+82ehF
	 b6g0LD43y4FlRcbRC+WDia2w6WmEuWI4oU/jwECwo3wZE6uYe6VJLMQjXfO5g3v1KIXAx
	 Sp8+RuLOMMHWLDqBrAefuybiIYRSivuG5reGnVMoaPgw6SI/LjvwaX4UcVrm6P64fR83X
	 V5Ufd0JFzgf7gngzatfdp6h0hmxzyHEgwUidtEdYCJy5eD3bD+7t+dTDDkGq5xIzZJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a5fU4Xwv;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1998B606A329
	for <linux-remoteproc@vger.kernel.org>; Mon,  2 Nov 2026 18:02:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1998B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a5fU4Xwv
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so1886404a91.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 02 Nov 2026 10:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793642560; x=1794247360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wjUwlJYpmWg4mChaZqQtsUzChcNIv0kOIN66bk7+k2A=;
        b=a5fU4XwvqBLEQVWzBtl7sWweokwZDlqumDIzuIDOPqp/EpN8QxsLcw/2stAEbMJHoM
         9m/31vH3SXCIvnf/jEUORyKJC0mA/Q+8tl0gNL9YahNEbTzgqkK4Qvo/JCdvl0klmt6q
         o+Rab2FxonaCOuLjgcCS9uK2ZoSFW/sjZ2ylCE7Y/dwkqar0ITzSYpF7BdRiXZl4sTrk
         x2RAekBWDLY/Ku69bIdlTsovVoZYOMxYkMEMqcO3s4FI8xocnu3DenkAoEzg4ptGNlO/
         xgfo+VafHlh0bNsBYEorT6CrATOOmmtxeXISLe82bCIfcA7aSQ5tazSl88sbvy9cVVMR
         K22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793642560; x=1794247360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wjUwlJYpmWg4mChaZqQtsUzChcNIv0kOIN66bk7+k2A=;
        b=G3+2QDo3fAss7tgSw1yoL5fA+QiSgFltYRp3XMtBw1yMBQucfBRmEjL3J7SPw4IynK
         FK+VoGSKX1QG/5cui3/xUry2zWrafvACZdry+BV0N8Tj58aK0kTNGm89pHy7KaQT34uW
         +2y48U7xrv/o3H5/eoCmQPQ5+Wt+09MNTSvUnvDQSxc5kfsdw50N0Wy1439hQZCyRenE
         GrySQMDBR5ZNUKfMRqv1P4uXcxoiMvJD7k9ZgJq6CsYMkemtaTScWBsgWyjPdwzLrnTH
         fT+O/u15kIFaGKfRtV5IwN+ErJ1pKr06RT4IifleOpCX7Mk7n/WIty6SnD7pBO4V/cBX
         bsdw==
X-Forwarded-Encrypted: i=1; AKwUvBxpcQ5hI6W0eoyOunLZyuW+ag7xvuaJtDCvIVq32INEnesNsyOZ4jQTtS738P5IX16JOhw5vH0KstyM7KbhWkK7@vger.kernel.org
X-Gm-Message-State: APuU4Z9kvq7fxwjE5W8KbpdqmrcLJBpIl/x00wHnfJ9TUJ+FWK7Ybj8u
	GAzwUUA+knWUJLAPRK0FgDyKabdtWuJP9IupXYmb+c4Bo6yKrnsJ1KfGRZYjrD+mN1g=
X-Gm-Gg: AYBFou0pVEKPF5+ZF5q2NlIP27W9TFCZaWTS+/caPCKFttDsRnMHSF6+IaXd49vXCpE
	UCHqgx9O7FqyxC8FbSthxSc9zh8QSj3qC6JoX8vWCKjzXp9kpWdyq8Zt8C7KDNJ6+/91risWBGf
	7iCBayvxiMXGXKeQWfm2ee8jG4kiEHJtyFxWh1SVdubIlziOCdAKLVmFfnS8exGsBIRjkgYl5Cs
	BAjYoewr4Tg+Ey484ZrBfgrie+MD8uDXJkRUQlPHWzDW7dBrGsn68sO0DseDEaGTgQs8xeWjb4Z
	eOhjhpJ/dhD2Y3Eh1vTXXOX9s3JuMZyVsJgzMJuuGd5KrGqqn+DYUBs5V8ZpgCipBbHhCNwyhDO
	sSIpEuWgxLMtqXDIJGD4IWAAvMDCw9Rtkng/cWGcM4PJqHtDwCoDrMZgb0IMuJqwkKBlsDAWu8M
	EQD3Aw3WFDBlGgEhedxTLRG2WYT5fUmLBU+yzxn7Qc+uqguMFE4uzVOWJK2c7WLkXCOoYsV2P2V
	tRu7BIJc1sDtbrQsaSXu0yu+4x4TS8YB35hA3ljycP1b0/OLnUSBLrVNXEm2qcY23QXa4oG/QCk
	yn8CQDTJhoM58AL5f5cr2ftkVbnik+s=
X-Received: by 2002:a17:90b:53c7:b0:3aa:412f:b0a7 with SMTP id 98e67ed59e1d1-3ae89559e5emr5539384a91.5.1793642558875;
        Mon, 02 Nov 2026 10:02:38 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:810a:982d:b93e:e497])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85f37e7esm8969537a91.1.2026.11.02.10.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 10:02:38 -0800 (PST)
Date: Mon, 2 Nov 2026 12:02:35 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Francesco Valla <francesco@valla.it>
Subject: Re: [PATCH v9 0/2] remoteproc: imx_rpoc: use memory-region-names to
 avoid implicit ABI.
Message-ID: <aujQO2gXhYx8NTwK@p14s>
References: <20261023-memory-region-name-v9-0-ad597887dfe9@nxp.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023-memory-region-name-v9-0-ad597887dfe9@nxp.com>

On Fri, Oct 23, 2026 at 03:52:48PM -0400, Frank.Li@oss.nxp.com wrote:
> The driver currently derives the memory region type from the referenced
> memory node name, creating a implicit DT ABI.
> 
> rsc_table: rsc-table@90000000
>            ^^^^^^^^
> {	ret  = <0x90000000>;
> 	no-map;
> }
> 
> m4 {
> 	...
> 	memory-region = <&rsc_table>;
> }
> 
> Current require node name have to be rsc-table, but no any binding doc
> to restrict it.
> 
> Since memory node names are not constrained by the binding, incorrect names
> can silently pass DT validation, as seen in examples using "vdevbuffer"
> instead of "vdev0buffer" ([1] and [2]).
> 
> Add optional memory-region-names property to define such ABI. To keep
> back compactiblity, use "optional".
>

Applied.

Thanks,
Mathieu
 
> Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
> Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
> 
> Prevous version
> https://lore.kernel.org/imx/ail0sH1UhnQBPRkr@SMW015318/
> 
> ---
> Changes in v9:
> - s/hidden/implicit/g, sorry, missed at v8
> - Link to v8: https://patch.msgid.link/20261022-memory-region-name-v8-0-ce5ce514a550@nxp.com
> 
> Changes in v8:
> - remove dev_warning
> - remove dts patches
> - Link to v7: https://patch.msgid.link/20261020-memory-region-name-v7-0-1413d5928340@nxp.com
> 
> Changes in v7:
> - move imx_rproc_rmem_to_resource() close to caller
> - collect Francesco and peng fan's review tag
> - Link to v6: https://patch.msgid.link/20261019-memory-region-name-v6-0-2e46b2e7d667@nxp.com
> 
> Changes in v6:
> - collect rob's review-by tags for binding
> - move imx_rproc_rmem_to_resource to c file
> - dts move related memory region node into overlay file
> - Link to v5: https://patch.msgid.link/20261015-memory-region-name-v5-0-abc358b39a96@nxp.com
> 
> Changes in v5:
> - fix binding region-memory-names's pattern
> - add vdev1vring0 and vdev1vring1 at dts
> - collect pan peng's review by tags
> - Link to v4: https://patch.msgid.link/20260917-memory-region-name-v4-0-260755920ebf@nxp.com
> 
> Change in v3
> - rephrase commit message and cover letter to correct descritpion and
> reasons.
> 
> To: Bjorn Andersson <andersson@kernel.org>
> To: Mathieu Poirier <mathieu.poirier@linaro.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> To: Pengutronix Kernel Team <kernel@pengutronix.de>
> To: Fabio Estevam <festevam@gmail.com>
> To: Peng Fan <peng.fan@nxp.com>
> Cc: linux-remoteproc@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> ---
> Laurentiu Mihalcea (2):
>       dt-bindings: remoteproc: imx_rproc: document memory-region-names to avoid implicit ABI
>       remoteproc: imx_rpoc: use memory-region-names to avoid implicit ABI
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         | 11 ++++++++
>  drivers/remoteproc/imx_rproc.c                     | 29 ++++++++++++++++++++--
>  2 files changed, 38 insertions(+), 2 deletions(-)
> ---
> base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
> change-id: 20260915-memory-region-name-f950eea2b78d
> 
> Best regards,
> --  
> Frank Li <Frank.Li@nxp.com>
> 
