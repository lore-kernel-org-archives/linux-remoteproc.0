Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFE437E5FA
	for <linux-remoteproc@vger.kernel.org>; Thu, 10 Sep 2026 15:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052802; cv=none; b=enEuYVa0+iQkg6qe5WfeqVtLkPtom9rLntvJthtRyvI70/64Jca4THJbLu+ieXscxfiboF4AyBy4gCDgB9GoUfPD9gsja0m3F0v81EXJ2qvb05ihbOh5H+cPqyfXVoz6OMRLNy8nj6UmPgI7e/ywZGyoGECv1+KZj50FdXV93Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052802; c=relaxed/simple;
	bh=HhKxfqZri4OGfPWO86TNfFiRawc8WRDx4wxR8ivdMMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUgv9U7s1lT3X3LN1HnKVw2Gp7EhBGpci2CFfQE2HHN6qpN/XW33lwtID+Sj6H85HZexgWe/y4ORHFrn/iBA3bEy0nHorfCSGwkAPehrUi/OqZvmIyGphSbdT0LfqBajsmydWC4JZLKKa3RfU/TPLIdUxyjZLLlDgNz4Zh86YDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DWMeiqBq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iwTofXjv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DWMeiqBq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iwTofXjv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AF4Z0Y1186655
	for <linux-remoteproc@vger.kernel.org>; Thu, 10 Sep 2026 15:06:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PkPrpuB/2JVj3QeHoZHTBk6+
	P5ZBHLDJoXGucnbPeZ0=; b=DWMeiqBqEHVh3r3sB6fUKU2AXhCac2u3sfAnj2dh
	/6caS+/4QyoMpgUoqOc2QVOc3zvRrHDuN1wO2YTZ46CiW2M11CQDEf1prnU4UgrN
	3owOi4eeco0GBjW9selJVxpLPdTCTfDfRzfFUtXg2lw/PHsBMVH0ilToDhW3N/WB
	Si62Mf/bHaxrRjk4LKrluxGrlZrAN3SiZnTEkcY+j67SRlwduRyRJtatCYXd7UZi
	9uUZ46h4t1Kmkooub0tJkgEWKcaabuRluLlx5xbaxguagD4H+4eEP+CybNEvQoii
	U/68grNkRbZSicAeVN6/e8dJrxvywGZEDcoklGSAUpoqWw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrak9yma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 10 Sep 2026 15:06:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398d292eac1so14521901a91.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 10 Sep 2026 08:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052794; x=1789657594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PkPrpuB/2JVj3QeHoZHTBk6+P5ZBHLDJoXGucnbPeZ0=;
        b=iwTofXjvi1eeO8dwVvyj4RLo+d57HVMKRXmi7/4r0lXWgDww9q86cTXKrRDOQ6EyKP
         OToFheiLGtc6IHBep1btGp2yx3oEvB5zOb8opjS1hQkqEzs7JhDmUNK8DrsXqYJtx0eD
         H24XS79xy9h8qycz6/TF0en74Tgxx0426cMOAfJiE84N0kvHoOxrLaaqp89KQgbXWm2P
         KMHA2CyoPlWBF4AIMTJE63UoXGmoQs30G5y+Jvn9pGMHAtCxQcwT2yseXuqzLFUIk3WV
         P4+P+hm39mx/KOzmvirbHYG91bZFTYNTjXCumto/f96EN5S553yzkRnlAwd+TZL6GGKS
         hW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052794; x=1789657594;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PkPrpuB/2JVj3QeHoZHTBk6+P5ZBHLDJoXGucnbPeZ0=;
        b=HlGXzpyyseyurQEqEYT/hFCOhpVBGSWFATbJUAMUTOSJ5m3i8rPkr+WY0P2BNjbvAl
         8P8pChUU7JP/5P9B/ojYWPPsmXVjvBGyc7FDetiXda2XP5yssYhexmXx4cu4eXawNsMe
         PLRV8KXwKLxEg3CEbSibjsm2FMmyCzbz/ea10CdN5ixixY+a/EdeJ0pq0PXU1S6zNTRb
         i2aVZptCFJ+bIyu+EOU6PnaPjwHxxOt0lvFUcAjETNqDxi+K/GUudYLjTtXeRdQbLSYq
         eLgy8sYfFf+13b7wgUpOFV52sjWT2qbK2FwA6uJr/YLISYf070TjuXlam8Vwo5qMC6Gz
         qJpw==
X-Forwarded-Encrypted: i=1; AKwUvByXrjJYVhVryus6A5Nwg2lbYLfZl1UrX9ShdRJEKFQIjN525AeYgSAxSyUve3wjIy6vK3zm4XWSpztTIiuaB/nd@vger.kernel.org
X-Gm-Message-State: AFuF++kB8PzaL0iPZqj8I2eZrCtAI3NgnXJ3rRRl4TOgs6A4ZpgeBz6P
	i+yAjYABtQqryE2hVgicloF5BtUOl0svREEeHwzYDMgX2FT74FrkEQti2zYpBlgfkogPTUbLo/P
	RxbbMNlwagXRU1hzOhFsS9Btfk9bzZbykafWnBT8U8mAuW/E4a5DcQ5WhVwUI1Hc02EBbHo6S
X-Gm-Gg: AYBFou3VMcXOkZVdP3WyI6MO+tvLHjqsiik5J+xxI2J4OjpLiriJj2gUg6//9h/aReO
	ym1fgpIYcfvUnYA8RIO3EsRabIrbcuBmYjN45haw/x7Nd2M0fp2uOD8NqNXbneq7FZRvbaucEDH
	znzXOzzHfo9mfwH38S49RFbxuyIaPOzzWOdouKKYv/ugSmIVWvOVucoTq3/OqtKCrX+OQp7FEhV
	73Cwp4L/zYskSUdjY6MmPFVEUIuGvoRvrGpOWrUk12gO+gopKSq1Jv6A6EPoXaTaDOktV+CmiNH
	u4uizV9rpEQCeZZ9M8Zdo+46w6AGnKuveFL+0dtyBFq8CFwo/MvskUCn8fT5b9INLVI6RGXLc3k
	+6ROeptpaPg6ZTQ8R8+Wl05SujDc=
X-Received: by 2002:a17:90b:17c2:b0:398:9be8:ea6a with SMTP id 98e67ed59e1d1-39bac4571cfmr18020015a91.23.1789052793741;
        Thu, 10 Sep 2026 08:06:33 -0700 (PDT)
X-Received: by 2002:a17:90b:17c2:b0:398:9be8:ea6a with SMTP id 98e67ed59e1d1-39bac4571cfmr18019875a91.23.1789052792935;
        Thu, 10 Sep 2026 08:06:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm47578520c88.3.2026.09.10.08.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:06:32 -0700 (PDT)
Date: Thu, 10 Sep 2026 20:36:25 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: remoteproc: qcom,sm8550-pas: make
 qcom,hawi-cdsp-pas standalone
Message-ID: <20260910150625.6sqdwduft5ccflv4@hu-mojha-hyd.qualcomm.com>
References: <20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com>
 <20260909105049.1317985-3-mukesh.ojha@oss.qualcomm.com>
 <ff7a5250-d026-45ba-866b-f92302e3c87d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff7a5250-d026-45ba-866b-f92302e3c87d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MiBTYWx0ZWRfX9ixtRF6eSrSe
 Cwh9Zfw2mfDS7kfGX+W3Bp32oMRAOECiY1ws5sIdJf+K5jNetmiwt8MScPpjkvRcdeaWcsbcS1I
 tHfrsovG0L0LsdYw163SSYGqoGO2GtA=
X-Proofpoint-GUID: ktOfFvjGkIuwEWpRcthHZnAgY78v1RCs
X-Proofpoint-ORIG-GUID: ktOfFvjGkIuwEWpRcthHZnAgY78v1RCs
X-Authority-Analysis: v=2.4 cv=EspHPicA c=1 sm=1 tr=0 ts=6aa2c77b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=LBkXyKVgYJf2stFOIyoA:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MiBTYWx0ZWRfXy0MDvI1owyLT
 AlkeSyKkc7qEF3ZAE+KOq1KAt7n4oKbKWtv3nZiyMlFgtoBdtjNMP8MRcsewCDrhX32woe1y2OB
 5VdnaEnQtTGK7DqF6CM2clAf/GxdRV1AflGzX/XQkfQie4b/TATE6dUrf98osASeWCT7PIyxT8B
 T7u57TdxtbPUUxOs53GC289z3HuXWcP/frtAt+Z8B6dH0s8OsqmEpepUhm0WVB9eftY8RiZHdoi
 MPEft9KNdDlNEW7LRFeuW+HIprs0o7uhPLb9/Y7U6ZDCJmCHv0HDRliDxlZ0WX0Cd9Vqx4VtWE9
 WT58R9cN7DMFEku2W/Y8WQiY/ZcZsFDfFg1imXaHcO1JxHiOImMqCUGeAGuxonyEzLOEOifhhAr
 vsh2PudQaCIBvtHW4zgZOAgyCCuicye6lMPnLB39E+SwGiDHJeqT6L0MiU+cN9fXjTU/GS41azf
 YckgFDSV1xA7eXfYl7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100182

On Thu, Sep 10, 2026 at 12:26:21PM +0800, Yijie Yang wrote:
> Maili faces the same issue, and I have verified that they share the same
> fix. Please bundle the Maili binding changes into the next version of this
> patch series.
> 

Sure.

- 
-Mukesh Ojha
