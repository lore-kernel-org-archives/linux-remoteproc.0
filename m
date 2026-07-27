Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14F43890EE
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 14:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163280; cv=none; b=iJ27RcmCUMwB7ffw6yYJGShYhSh99uB+EuG4K46THC7hVi8hfmXCsKIrOWe4gYz6ikSLmInHHjtfbLuJzLU8u8TpSvat5SZ7L3UcqkEhmTWplTRjeq4mT1gzhrI+n4NCRV2WwJMAlmrIaDoaafbnsrwE3nT/ejLAD9T2KFGk9MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163280; c=relaxed/simple;
	bh=5md6KuDV9zKp8xQjKCQNmMUhPxeLSlGVAcREBRwuPlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WjFG3YIzxDPSQiXUwj2NwjG4JJX5YB2qnx+rhbgJHSfKK+kW6l1h7Foz1q6aFHHSZMPolif/STLuwTFoo+hqMvhQlPM1FssJfqAYuOX+BTDbWjld63v/w4MgihPZEmHDgTKfjENcaQrKgzGS0J9NxI+BxJfNOViI1Ov7mC4tCkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nefTiTcg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KpIVQCky; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nefTiTcg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KpIVQCky"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlmOF4035419
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 14:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=66BWVdedUAV3Y/tDnbicjHtC
	ixDv18yVw6FXtU6dtBI=; b=nefTiTcgTxVRQ3xozYEtBHE391F2NsFXTrk0AB24
	c0qqy76qEOcNMbs/V/NxsCHRpaubvBh6kvOjyz110AE7uj/yKOOCJCqMb9LSuHur
	sK42CewYJBv3NQRh3qu1iAdTom5wzlkaImrDDRnXwdUBzP/f6UxYyEBwERNCp6VS
	cuY5PqPsc8ilr57EtmqEieg2YVYuLxtW3xC3EagJVfrmvVhDEudALj7wYHa/Ssa8
	RpO9zs9awX/KT6K6RWslkXJc2tPeRtG1upaKug1DOBEl09iM61aMczF03EHX0Lk4
	EOtQief8Ed15SIfzvJ5XjUAK6spos/KZQjjUQsPzWcWh+g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp30g1qrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 14:41:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e7621655eso5304342a91.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 07:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785163275; x=1785768075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=66BWVdedUAV3Y/tDnbicjHtCixDv18yVw6FXtU6dtBI=;
        b=KpIVQCkysmqcEWhW1xx1intvVSc0d67Gy0Z8UPJV5Au2BHOVFUIsT9uy/Y0ycmOr2Q
         mSWyKZGH5KafXbfSfVwuetSuw7ANkCoXMrLnOIm1CahjBfV6JtSUkHpA+wlSR12AfELL
         p/azexzju4KiuQ7LBBZtfW7BrdpFQtoY28QD165QFStcwSpXMjsW6/fL4+N2PSthgYlZ
         o6Fogd+HY7wDxF4iqFMTxqI/xENPs0dKwdezYV1waE1n5qx5Z//Uo0SSuM1H9vq9pd59
         rM31gev07B0b859St2vJ2Zz197HwsLCP0c/u1rufAWkGGGrOPLggEn8aoglRAx/zBa9X
         KwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163275; x=1785768075;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66BWVdedUAV3Y/tDnbicjHtCixDv18yVw6FXtU6dtBI=;
        b=nfiDkxqtctQSEqihRBMccQZD54ZyMOptFa7mKukDuM+DlQvqXsMHapbavHDzLX/A9d
         wUic+MwpwQNSH8uaZZao+mwWQFXbTwByo2XJBn6Z+DeNy6m304WBfTU1PG1KICq8/U74
         70C0AQ0UuAsRw2ArCDgJyYzE6gT5MnRPWA1BZz7EzaMYBDBKvLqQhHgB7AckCt0GovYb
         uBPNZprJrO8BikNPsyAPARAKxetCuke4BCvsPXddZQF4cXHD9LXMYA/Hmfc0KIxEXQWz
         0l3N31HIH0Pi7qQvstf5OVve3IGSRXwROGaX/OdDUG9PtEAygItj37UggQJxk4rbfbkI
         ir1Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr+V/dFbgKbUUtr3tHDCVHfaZc94DWC2wEyoYkMQfnukbNKNjKlifJoTHnu8tDkfvf462m5Z6CdMHJhD+5L58UO@vger.kernel.org
X-Gm-Message-State: AOJu0YyJS3K25aNC8Jvy0zxSbfgXfuwQxi6Z0XcLzgQ5mOObWwaYowvw
	/PqNFEhvPHVN2+dUN3VkcO4orw/TcqgDheWst4kOO5aXZGwgigpv3aHX6zbxsvHL3sOr6z25Jao
	YKBiG+2HkQ06fqRtgk03/desbmJn6YA9EYi2rxSZg3LyOVVTtfcfb2eoufuOvDBIiUX8sfSr8
X-Gm-Gg: AR+sD10p3F3kn4vVanEGxh411BVJc8Wmb9HVVVBHr31rU8J6FxMn49SzE8gm67BAa0u
	mj/G8HYj04Dubdg6/OapeDfZzST7bhNPGrUQ4dm7dlkakTWWUCLzFGCI81sr/pdzhxrGnNctuXU
	v+M3qp44GBchA7N/MCtx8B+uInyRRz2hiVwSW4VahK8ErIP0k+MkTabIof6pmRwOCMV/5boTgSA
	/JdCAF2BaxyIgpAUQKKV8+bIfodM2lW/tk4mrP5Tl1mEOh1V3wPYFNAKhAQtXDYhTfcs7uiQ3qk
	o6iti25FQebgzC0ASd2NC7J52naKys8F0QtV6zUhEA9exeXmrJDEtZwM3eT4yxqZrqEn84A2sEW
	qB9HTbXhD7Wp+GO4WKkTS3NjZnqg=
X-Received: by 2002:a17:90b:2689:b0:38e:63de:730d with SMTP id 98e67ed59e1d1-38f293cfd0bmr7865367a91.3.1785163275080;
        Mon, 27 Jul 2026 07:41:15 -0700 (PDT)
X-Received: by 2002:a17:90b:2689:b0:38e:63de:730d with SMTP id 98e67ed59e1d1-38f293cfd0bmr7865327a91.3.1785163274477;
        Mon, 27 Jul 2026 07:41:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13003f12sm94957307c88.2.2026.07.27.07.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:41:14 -0700 (PDT)
Date: Mon, 27 Jul 2026 20:11:05 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, chris.lew@oss.qualcomm.com,
        deepak.singh@oss.qualcomm.com
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,shikra-pas: Allow bam-dmux
 subnode
Message-ID: <20260727144105.t2yz4jpkuiykem3a@hu-mojha-hyd.qualcomm.com>
References: <20260727-shikra-pas-bam-dmux-binding-v1-1-c0159c7c3ed4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-shikra-pas-bam-dmux-binding-v1-1-c0159c7c3ed4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a676e0c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=84DI8ZDaYnnr_gmyIqIA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzOCBTYWx0ZWRfX7rB3S4qFC27+
 N/dJcJVh923RGxFZm6Fp1jrWskmilQZUSJQ10MBnfSFiT5qXVgYHloMk/C7iU/+cy0QwKPPGL0E
 Py/QjU4dVUVQupie7WqhnB8v+wmLnS4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzOCBTYWx0ZWRfXyOtjZnokgrD3
 g/Fr/o5P/PtXJfdMIInfK6GMVkOENTPn6W9rfeLk9qCtp76EgbfracR8Yld4Eau2Bic/53J0Fps
 t0nJrESGcqeR8DVBRtPad+mI/I/55fxX+lc1ALXvipHy49wzLy7YTOQRaI9fnj+6DnH1wXWU95j
 d5rSlmhSm+RKxwoBUumylgUdSiMr0oJE69r+IC30YkUhfAN4AORBqZDfxHSndmcc7kRlXpvhsq8
 mNKBLbG2GRm/pxXvt0QzdkT1fRonSjtWvv9s86U+amyRUIyTzrueLvEKYYsjmjcJ+9gUGxY47Zp
 tosZ5wWY1imP5fMmF91/5jGJDzQVgceN/PFPuPCmbPcV9S1tSbKHnXDWb3azhmzKe24IShF+sf2
 Iuq85L8en3aHFH2UoFCeWOkCypQUaIsMiUqOk8mNN9tZfycx4k6+6dNy1IzX6dDryEMvDOXF6eG
 qsW8lX/ttZafECeQeYQ==
X-Proofpoint-GUID: QEhXQk_moKJW6-SpZA8uBLtRL6KpCPs3
X-Proofpoint-ORIG-GUID: QEhXQk_moKJW6-SpZA8uBLtRL6KpCPs3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270138

On Mon, Jul 27, 2026 at 07:47:33PM +0530, Vishnu Santhosh wrote:
> The BAM-DMUX node lives as a direct child of the modem PAS remoteproc
> node, but qcom,shikra-pas.yaml has unevaluatedProperties: false and
> does not list bam-dmux, so any DT adding this subnode fails schema
> validation.
> 
> Add an optional bam-dmux property referencing qcom,bam-dmux.yaml,
> mirroring qcom,msm8916-mss-pil.yaml.
> 
> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> index 253b14eb2b598f0ca91854c8ff4d0b785090e621..17461d92165b26eb669809ed7dcdf029530c9223 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> @@ -44,6 +44,11 @@ properties:
>        - description: Firmware name of the Hexagon core
>        - description: Firmware name of the Hexagon Devicetree
>  
> +  bam-dmux:
> +    $ref: /schemas/net/qcom,bam-dmux.yaml#
> +    description:
> +      Qualcomm BAM Data Multiplexer (provides network interface to the modem)
> +
>    glink-edge:
>      $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
>      description:
>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
