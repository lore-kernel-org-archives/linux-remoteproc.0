Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515290;
	b=fryySWqV6VAxxkiFqEJrFf1wrHMFMW6S780yTy3DJwA2Yexl1EtojlQbXnVtYO4eLk4p
	 LLaJNBKUlMOJxIPoLHVMmZrQOZ8UTmdzD8F6kJaPeiOzC3BPBVfbEGHbOSfofSaVFYnvi
	 /NsA98YnjhV0VawMafsMBZicqoUuJePeiM0YdiZidyGBoPOy2LUKkBx3zpz9WwkRYjzoW
	 Sa8P2r1fp/963mz0PjSbQlZXZmZaA1xKPZhnpLcNXLS9HU4BisUxi+Wf792FIm5M9zHLA
	 dNacAWyCr1DwXibLhgc4kas8+hF53zJUzRTc3FtEWYtmAt/wxLKB70faRxh0ckKOdPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515290;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qk5z0LMGZDeAjOO0is3KJcdYLiEOWcWt97+nTtdMwHo=;
	b=J/2bull3QjRwBoP367G+kY39vzrhyxNcVLHi/M93o67/pgORGvJ6SXN0Ty23UvYzvXEl
	 A7WLHob4MIr/Q0/JmyT0rJKBTCaajEvTLulPQLu8lD0EFcvo+VnqEpzfUo5a6CVtm/48I
	 Q4cXcnhfNYl7irTviPldIHkdDiZp6lb2rqokXN2lpQ+JabFNHbK0/yRPpOZmPaILr/J3z
	 eVUtOvVf425nUTGunbGux3OG+S2n4dpz77n5/BR/qWyT6DXYBfpCKDsYOX0p21RdPOz0r
	 CIs1RWPhLnLv1UImhWnycgp0nao8VJESdssdBc563LFmUcs+mX54MYkOz0Ywz+0mm5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VFR3B1R2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AIRDQFzC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFB7606A6A7
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 10:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCFB7606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VFR3B1R2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AIRDQFzC
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8VLnh3701186
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 10:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qk5z0LMGZDeAjOO0is3KJcdY
	LiEOWcWt97+nTtdMwHo=; b=VFR3B1R2Td0bQsw1M1DnPcEQpKrSI4aiQmj4+Dgq
	palLmVfgzbVR4pKHEFZI4XMw0Q0KOGuiVjjVBG98f6F1wMaNpzj++zqSufU/JLNc
	pvfDtW0fz5OygALJ3Fa0v/s0mJjS3kNSklZOj8UHj6Ux0hwf2LSsW9RdZde3nyeU
	dbnOpF8YLR7KMxajzIdIK3sjm3B1DpiipLPqDs0q3Gq5A8DFKcH+7nla1Hx/x5Sp
	7if3aSkguDALLfpaD9iNarxrXUU5M5AJgemnZErBDx1cbpcLlNDD73hRZQimNpfk
	EFJm+or5mZI7fk6TN5gfG+Bv5rhU8fPYthNUH3h4yoej+A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky20t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 10:14:48 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b56c696405so3465574c88.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 02:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795515287; x=1796120087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qk5z0LMGZDeAjOO0is3KJcdYLiEOWcWt97+nTtdMwHo=;
        b=AIRDQFzC6U91Eo9MLbSCG1Gn0VN08OOH6jlM/Ti54hjIYmsmj5OIGymJBQMkFm7KXm
         AU8tXHOfl6c74hnOPoVsMDiMnt1zsFTrMko3uiyOAUTaPr+5QHUyYUgk2GXVXuM+P8ri
         iQLPl7wPBsisiJxIKczmfVw2ImMDz1KCf0SiADDtABNSfXBTQ7jIKOBsIEc4Lp3qVf8Z
         yP/jpUuhd+CXwRxTYd2av5Z8e5knOTUyiJjSQlGrvOcNjecudY0iD9n0TH+8mI0OYtvV
         E5vIL4V6D9gcajujn2XQZX54nnzcmnMP64pnxwk3EZWZNCoq/EYZfePHt+/t3/fK/MgB
         ohnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515287; x=1796120087;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qk5z0LMGZDeAjOO0is3KJcdYLiEOWcWt97+nTtdMwHo=;
        b=BWuKiKFnTJiD4sx0vSMbDZIQbiE+dV/g+cVWN4uuPS0HuqFBvEYFWvC7ffzGtC+RwR
         qGF2B/YsA1esbNSdjtoRrKvNNuB4yDKWPB0jx0D9ShnHVnd4FS2TkCCJGnKdoyAPOe3u
         674N6NoYbM2MBrE06lOk8c3oJuKSSgZaBy/wQqSazafyrild4Ppckfr+Aj3DOcbZV9Sa
         LKyyvjcjuviKt15zsPA3GiKTRNExwkyuUUaAxLj6zcbrKcHwyhl7ByDv+EN/jS/Vl0nU
         i1W++SWpUzyzxfWp+5LZzriKXrLp4YgNWcLGESgLbt814u767k2E6VjUuVqUtjX7/ylU
         MMSg==
X-Forwarded-Encrypted: i=1; AL+hErEy/7ST9fm3RHX2BC5WOUjeyyC2d7QqmZS8l/AKz//3zszJUYCjnIccYNsExyx3ohnM0l5M+DaegRHMZY4hdi4W@vger.kernel.org
X-Gm-Message-State: APuU4Z+pQgUnFjjDx/W7LNlXVBt1pdL6d/9SkQle+2dfw1b8NydxeH/f
	A9KOu7o6lmDeSGYU+0kPmfZOjpvcEABtgrSTfGT25jvShrH/qspFPVXLmXKdUBeSQgTlXaw/u8W
	PqcXJs8/iRhc2rRy4OjDKqu92OSoMrZa3fjOGfZO5K3CM6a5UYYMRYATUUbikqkiinvWLgbTi
X-Gm-Gg: AZFdTZeQMvEl1v8Vq+/D/63ImNgUcFlVmZlhhjO8zra5q20Aun0VNcYYwOmpuxHW8Lt
	mkXk/3Hr5w3H8FOaakBWmCttgs1ujejKXLmIJ05t/B8fBAEc1pAum3rHz/i4b02mmuP4EyB4S/Q
	yL1gYVtZyW4lN92+GHyGHOvW8jwip95qIYP2gz8Y5ot6TJjc1cP2C6nj5EL+4MSueKFbPwkSHQ9
	RCr6LmC38X4jCCDLPpegO1DsahlyAlJ5VUkB6rxQYedGmEC+98E5xgtdAseiQKVxGwyC85bFyM8
	GThuoTDjZHgdSLJxve3DO9ierAAUYb9O3ODIlXtQRVlRNkq5HCdhrmVDGEX9ZkUG/dNYnRhN1Ll
	2cesQsmXZpjQHQu1qMtWsKNN/Cm/JaKMIvn3Hcl0957z5hjjHNh8CTCGwRdqnw9L1YL0v7S5aLF
	FH
X-Received: by 2002:a05:701b:4555:20b0:1b5:3616:5961 with SMTP id a92af1059eb24-1b556823656mr14255593c88.4.1795515287257;
        Tue, 24 Nov 2026 02:14:47 -0800 (PST)
X-Received: by 2002:a05:701b:4555:20b0:1b5:3616:5961 with SMTP id a92af1059eb24-1b556823656mr14255550c88.4.1795515286532;
        Tue, 24 Nov 2026 02:14:46 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm37791810c88.6.2026.11.24.02.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:14:46 -0800 (PST)
Date: Tue, 24 Nov 2026 15:44:38 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 3/5] dt-bindings: remoteproc: qcom,sm8550-pas: Allow 6
 iommus for SM8750 ADSP
Message-ID: <20261124101438.n46ncolgnghojved@hu-mojha-hyd.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
 <20261120-shikra-el2-v7-3-9d9000eb50d4@oss.qualcomm.com>
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
In-Reply-To: <20261120-shikra-el2-v7-3-9d9000eb50d4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b056398 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RHyrlyLPk3cZOz1Q9CoA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: PQD6wdAipZUgiBgWT2yXVFNJhp_yC9H4
X-Proofpoint-ORIG-GUID: PQD6wdAipZUgiBgWT2yXVFNJhp_yC9H4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzOSBTYWx0ZWRfX0w/dyld3jp+p
 XBqhXLyZXS7YZs8jf8yXosgYk0c4FPPqolytvjTLuvNTcF4ZizK46k48BsVDg5CzxL0uppGNVIY
 GoGXMWRSIX7z2P5alARVQpZxXYY2/mY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzOSBTYWx0ZWRfX5JWthjnGrER2
 FHcqufSoRLF2C/lWDtla5/e7hQrfSX0wD2ACS96SDedSgGouC+pkZtuE1F56+hejuxMsf8MjCH1
 ExrGBYTkg+RN02bnsPUChdpXpM3a+kS3Zh3eyFtoFLCey5zJcPwiJ69tAyf8BK585cA27V4ND5R
 jpiW+lTL1yIidgeJnr7nirvM3iVNoeeiZx9jtxJBbkuETYuVdY7uVtE/LSek3yHlfOvATdRhrYI
 l3ju86LUH9lBZmSzAeQzPfn3SlwYmWPJytFdkhyBm2VYCf23lsEBvCcsf/XarS+haf78apQUAbJ
 uFA7g6hmuKOLQJEhXrgX/kU4Rnr2n3WtRpGwTXkR5IEzmujC6C2+3ZOLjvBQ1U5vrwlwpbXcjMa
 2rbs/Wm+WU8NNV8wKkoolObUIzUxdCaLwIo0y4etNXaLx4Kp4PX7BAqvXXMT/lJHaGWycWksl53
 0vHQVIoU+gNutZb8w4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240039

On Fri, Nov 20, 2026 at 06:50:51PM +0530, Komal Bajaj wrote:
> Remote processors behind an IOMMU may use multiple firmware streams. On
> SM8750, ADSP uses six IOMMU streams, which exceeds the single entry
> currently allowed by the binding. CDSP uses a single stream, while MPSS
> does not require any.
> 
> Allow up to six iommus entries in the binding. Require six entries for
> qcom,sm8750-adsp-pas, disallow the property for qcom,sm8750-mpss-pas,
> and retain the single-entry limit for the other compatibles.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
