Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D767F30567F
	for <linux-remoteproc@vger.kernel.org>; Wed,  9 Sep 2026 06:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788935129; cv=none; b=kZN5P0y2+QUbfiuF08rhRgKgxw9a7sYfbmzSSk4fyJkrXKPawQbvnz9G7HQbelIOmDnkK2wikVgk8Z/cZpLseMBLDQfC2U7uqUo4KEhqsAok291brT/SIjSQboBJhB2C5X/PQY+9fnj6e06gUATkra6/QnLUpuwQvxtFJVXApx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788935129; c=relaxed/simple;
	bh=FDQ9oLvB/9iSSTVI500C2ZpyBJeQzPCDbocIK8dDvhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pC6C0GkvgpBKoQ2HlrRdwrT8oovTs53i6X5vmTenfwWAuXU6EYxo6xZn95H4weT1YrqYHoAujR8cwM5wrk5udjtDIXZLAxt3pQjhlR8bDSepEUxJTVmTxSNR4f5QnivlRhBGW/pDJc7bz/B30yKMpr8xjzjQ+JiqvHTp61Vo9Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RqHBwc0m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JqH6mPw/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RqHBwc0m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JqH6mPw/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896MTjD129581
	for <linux-remoteproc@vger.kernel.org>; Wed, 9 Sep 2026 06:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0ix6p4PpyFStk4fVNnc9uhQH
	KpowRpwa/lE/9HRH0oQ=; b=RqHBwc0me+EtdiXAUcxn/DYJuHnggAZZu/EF+ge9
	LpqGj8JJm4SQ+PYNrUj8IrTskEQFFyPeGpJSH1ERl50gPCSEHXgPXN7QANAtVi9S
	62DrXWF/myxYtEX5BeuH0pZIyrbVKe6pVTyh25wJyPpkXVkdmYhYE1/Ym7az2U1p
	rf6ThAXzgyRFKweuw/1TbsbFnd1a+1M/8Uebq3nBOLaFvB0VNEn0xQOe4uk3Ho9y
	Zp7U1ILH3swoEYRotG2PkWfjZl0RoMgWpXCLA7oMUacJyccdyuhJIJXoW9TEF4lE
	Lns1LefHGv/6PUQawYCcogQqRE8tGkE5SuSEvfqRcXbSlQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjntpk24p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 09 Sep 2026 06:25:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-385d2703b64so6504534a91.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 08 Sep 2026 23:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788935126; x=1789539926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0ix6p4PpyFStk4fVNnc9uhQHKpowRpwa/lE/9HRH0oQ=;
        b=JqH6mPw/WkULHQ0XnnN1nreRCnZi/ZSGE2iTzDICFefK7HNV5DDumhCsGmZEwG/4mk
         sJLTiaXr93SSKN4zM4P0W9IRswhxRSut5e/DFEGD2ixRP6J/p27jZy7/Niky8wxVLtmB
         3T7dAfMRewZRLKGxyLAnNl1HaoOQdKLvGoZTOJLyEzZ98wxxP/VmiXIFr1/RLlO4AVUA
         Ulp0FvPO7WfMHIgPmdOuckvjqDdEKJl2VLYGiaoC1r38zu3h3Yungjm7W9lrZKMbmNPG
         2Ho4Q9NKCAtka9NJmvNHqHE1OJltmmwZMY4J6FmQcC7lZH5K27Z/r8br+f5P57auvW5r
         pcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788935126; x=1789539926;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ix6p4PpyFStk4fVNnc9uhQHKpowRpwa/lE/9HRH0oQ=;
        b=hVnmjJs+oxJdb/XcKKJdJNxP+M/EoBV9OdHB2ehkmPAz2lRjqpoWqTQ8YAMLyLexTd
         3HdGoUxU15dE1+fx7U3JjZP/wU/LkgcI/sVS/4hI5WC2C2SkhDsNaGLinhESitqZnFgn
         KYk2lDXmQtMFFolr3LELiuhcE8+Cgr7WPPCa1vVsl8QwxRyiNoQIctXadN4Ao13A8A6+
         R5BJbPUlUax2TSIQdvxEayqa+Y05GU+xl02UvF6GjUSb0Be2cA5pTZRCRCLhI1QApmc+
         1i2wlp8yIG7hJT1IsZkko7hd+MD7LdYCdu7Snpk3kqKAbD/+dLs3+QUpWG1BniF7Qcue
         kQ8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzLkNi0zkaxS8CyX/PVBibnrf0JCwxBUlWaEEeg7Ri5h0D3mHU0GjvLXYoRbKpUXNFluIL+tYVdpoudhr27OLZL@vger.kernel.org
X-Gm-Message-State: AFuF++llsw07WRMoqYemkyG9iPw1c1mYxqmNnhDXtY95VBni4WRMERfX
	PXLoru2tyXjXAnRTUQYMDZJseMgswZltdNMn/5OX1JFjUNxTfcHuwmcjLPhXJvWG0Fhn84/KF9i
	GCEJbf0MLOvGacZL+Sxlza8OHpAgzXD0ZLyWUbSK8Ge3B3kTupukW3arrTZHxf7aaJAZOxktB
X-Gm-Gg: AYBFou0ZJBhY+XjGxGwtSCt0Uk14mztoHOK9lHGCX1UjTGn4nQN5tZyvW36Ygngkybb
	OzaeM9COTVpPTbczck093tuf4YP/lRt175Xoj8TZQCIviq75Sd++pmkH7HqH5Ns+ozq0aOmIAfS
	xrmZtBUk14RbmXP/F5CjZdui0wCkDWimgLCpaVT/4p4yP2m+xwmf/AUJZQ1qfQJ0xD8RP6iH+J+
	irNofRM0sQmL4/Y+ypzjNQlRIy4aQIcPMrtboGnrzMXUuTLIa69nS6FXMgUNwiq/G8fzHE+SF3T
	8Mi2ZT0oSATrWywu7OHbqplJVgzmuqf0O24hal91doV1CSKQQsrlAzs1UKUy+KQTe1fefjJYPS8
	b+9uAkpHnwI2JcM3jSqImr4ce3Ko=
X-Received: by 2002:a17:90b:28ce:b0:398:a649:8fa3 with SMTP id 98e67ed59e1d1-39b08799871mr40500086a91.23.1788935125570;
        Tue, 08 Sep 2026 23:25:25 -0700 (PDT)
X-Received: by 2002:a17:90b:28ce:b0:398:a649:8fa3 with SMTP id 98e67ed59e1d1-39b08799871mr40500048a91.23.1788935125089;
        Tue, 08 Sep 2026 23:25:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3369856a9f7sm21872041eec.5.2026.09.08.23.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 23:25:23 -0700 (PDT)
Date: Wed, 9 Sep 2026 11:55:16 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] dt-bindings/dts: qcom: Consolidate
 SDX75/Hawi/Maili MPSS onto SM8650 fallback
Message-ID: <20260909062516.4mtuca4jxxz4s26a@hu-mojha-hyd.qualcomm.com>
References: <20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA3MCBTYWx0ZWRfX8h9kfXqj6P6u
 P/4B66154tkY8hDBS4UTplfNe6n/I/n6TCF7nePqZsIJu4CSdgCpcd+OpOo4Xnci7C4n4d09de2
 HeatbVFm042XxWjs/qfzzylSChnrCdAIIb0/ThyjYlVnl68yjoVFxTCqgwBIOnz+I+szI1Fpsfk
 Fv5moqObMh0ADpUlClwMe9UKrUwvAdJjOTs1ABDSIfrJxSJNXSzdOxgOOBfYouvKIQYgqNeWpUj
 44FGTchqnRhyDGE2NHNBWtiGfUfYVd02dSoNLZFByrYcN0sam1gUxDRL02RLsb222LUDP49gKY4
 LwcAAMyqx9+zXKnkV/T3OhmPWpIN7HKHK6Dn/7MeUIFKU3t15ITcOULm+rc6UcrhAfh0pOjGesi
 1br0V+J1LPWC280zxBy93bEqXSblxLWrDoe/OM5SPR96bB9eDBJoQNtUCnBpRXBmIYGJEnSMmy3
 QN7ULuNhia2yJq7zn3A==
X-Authority-Analysis: v=2.4 cv=N+AZ0W9B c=1 sm=1 tr=0 ts=6aa0fbd6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Ze5UrtUNWv7jlsdZOrsA:9 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: VPQZsS-_luDxGWaKYmm_XYeORNuFKll_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA3MCBTYWx0ZWRfX/m3X/5jgE/oz
 By+G5GjYE0/T6qPPmKIqdNotVX74e+GTLSYa0VTxcVSwSekTxlQLVJx3h30Z1242g6aRndWLQhm
 24BvgfubBOtpiOZ9MI/j3kueeZ5UsHc=
X-Proofpoint-GUID: VPQZsS-_luDxGWaKYmm_XYeORNuFKll_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090070

On Wed, Aug 05, 2026 at 06:51:26PM +0530, Mukesh Ojha wrote:
> The MPSS remoteproc block on the SDX75, Hawi, and Maili SoCs is compatible
> with the SM8650 MPSS - identical interrupts, memory-region layout, and
> power-domain topology. Today SDX75 and SM8650 MPSS each carry their own
> standalone compatible and are repeated in every "mpss" allOf conditional.
> The duplication hides the hardware relationship and grows every time a new
> SoC reuses the block.
> 
> Move the three SM8650-compatible MPSS variants into a fallback items
> block and drop them from the mpss memory-region and power-domain enums,
> letting 'contains:' on the fallback compatible qcom,sm8650-mpss-pas
> keep the constraints firing for the array form. The binding change is
> split into two patches so the SoCs with no in-tree DTS yet (Hawi,
> Maili) can be introduced independently of the SDX75 move, and a third
> patch switches the in-tree sdx75.dtsi to the fallback array form to
> match the tightened binding.
> 
> Bisect note - patches 2 and 3 are intentionally split
> ======================================================
> 
> Patch 2 removes qcom,sdx75-mpss-pas from the standalone MPSS enum, and
> patch 3 updates sdx75.dtsi to use the fallback array form. The tree
> state after patch 2 alone therefore fails dtbs_check on sdx75-idp.dtb:
> 
>   sdx75-idp.dtb: remoteproc@4080000 (qcom,sdx75-mpss-pas):
>     compatible: 'oneOf' conditional failed [...]
>       ['qcom,sdx75-mpss-pas'] is too short
> 
> The split is deliberate so the dt-bindings change and the arm64/dts
> change can flow through their respective maintainer trees without
> cross-tree dependencies. Patch 2's commit log documents the temporary
> breakage in-line, and patch 3 resolves it.
> 
> The driver keeps its standalone qcom,sdx75-mpss-pas of_match entry so
> already-deployed DTBs continue to probe. The binding is intentionally
> stricter than the driver; pruning the driver match is a separate
> cleanup once the DTB rollout is complete.
>

I have a series dependening on this, checking if this can be
picked.


-- 
-Mukesh Ojha
