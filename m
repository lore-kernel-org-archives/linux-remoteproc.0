Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930740;
	b=cn1yMIy50Xl4+qDOW2SoNvQ98DLK49t8X+TkAwkBtJyGKpcapBTJ8uJuQoDg5/Jsxs8X
	 LfXCSJQLL2wKJ+D44AwG5Ovf4vM0qe6mKCrGi2Ut2y10wDNRf3eTYKEon1f8GzXjQg2SY
	 mJaD528Uzamlz2ct22Z0JxlgDiN4PFMmjsIv45qSd2Gv24cTLM/SJ683YLCY+kOKEdkWj
	 8m49i4B/hRPUL5R0EO+Ljybm/XF1pH6w8qMGfeCB08h4rKn1KxjnX4Nhxmtz7kv9pD0RT
	 7w+m3ZcDIHuGVb3ro6dq+s0HBqMzDCFXiOkqoqh3xd5ORa963zt1tCF2qGqxTUKXKGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930740;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FmGrMIbX3U/GmFll4bp4B4R9IonCrAbCABRwgK+nqKg=;
	b=4Z2NI/uSn8zGC5QVHPqqOG3YvsPDY2gTzRaCyFC7lGjZKKS9dqFWQ8Aarl5+Ceo4Ikep
	 hCz0S2D8naW8pg4BUucosn7JErW6XfHzrLgAVbJ273Khc8kND1XXIk4O3tMMVQbBhrOkg
	 9cHtCK4g85p00Tr1GWADJh9ICcQ0QIY/BpYtH5qvFIj/CGZkr55zuFuFL9GvVW3EM2JHx
	 3mLGnJ+TZo+GuqUB+B4oZqqWvrSoISqSXjtmqn5vmKiDzBpIb9Op71epQV1MOcV4A7nxl
	 2FFHOzvYRD0ctyEIz+YvaM+HI35hpIxMedKgzWhW0hhIu3WfH35b6L3JAdPyLds4ygQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LCJy97CK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Ff2/wjmY";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBC6606A31C
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Nov 2026 15:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFBC6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LCJy97CK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ff2/wjmY
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFQMZG1141618
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Nov 2026 15:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FmGrMIbX3U/GmFll4bp4B4R9
	IonCrAbCABRwgK+nqKg=; b=LCJy97CKcfTS8s7rGAMfk7tN762TIevSlxFaIfrK
	0kSHf/kxSmhdDdZZTSArEA6HsJDigvKdLDhk/QhLwLeoPy+yvUh36qCdQR1QV4o/
	p/sWxIrR9Pi6Mp6gFsuHwe9u25AxRpRrlAhFA5y4H7nBZnGAPKmd0k+aqirvSAjH
	MYEgQU1V7HEBByT+6agp84N1MVrRXssFbtwW/SF0GwFJcQvF8g32N52ZGwb5uEkQ
	K/MnfrFuhJ4Ydm2lFbZU1UIoMn4rNva3BX5EzYqYmGKsIIWlkW+tHf0DxpSr+MsU
	WPc5t8Oqyn2WjO2YAZ1QPBlkhNrkGrw8ouWpYlLXigb8Fg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0s9t07f2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Nov 2026 15:52:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0a7cbf164so5391434a91.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 Nov 2026 07:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794930738; x=1795535538; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FmGrMIbX3U/GmFll4bp4B4R9IonCrAbCABRwgK+nqKg=;
        b=Ff2/wjmY7nbtXRCYKKjVD+UReHwpw5C/ZDgnqbX60guWJgvZf+fOKaSZRiJS2NIpXm
         Sff0sKMrrqnzX3rUkS2pzlLQF6MZM1Hqg5B3NmXgaJUMrdk+KNj/lV77uk0oYktxpua7
         yeTSvtLOkI8RzIdN+zSZoY3uctv2pU4OwZH1wmkGb6XSojrpF9WI38K1h+5zwID7UDu/
         NIHX1H6DZKCoLzQ7WvVdnJ17diNc1F4P7fxzhFfMt6NSms+uqOYOwLIDTomMuDlmQ9kQ
         MH0IjLhtAKNVyxQT/d3YBBwLGVqr6/tl/mZpPVbB3iYpHA5S0bwdiX3hKGKbQHvR+JuV
         O7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930738; x=1795535538;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FmGrMIbX3U/GmFll4bp4B4R9IonCrAbCABRwgK+nqKg=;
        b=BPcCjEmme+QYsyIotoZjIqXUTrD/lNlp/4FFxicP0T9u8YKSDj0Egbp2RI8/YeSxn7
         6e7xo5LO6lDHQTi0BDc/dpz/hwMoR0YG5RmTfEzL+Kqp3T81x2jC/fjUFy9qgnKTzCRr
         V4TPj7kRSOytlX4tT6yxJ56GpMM2qrjJCMLfoM6ufEi9neW0p555m3WaPkgHcmajWcgY
         FS/rRj+RlSZo22v3dd1AeDFCcdkBftoFcp37PoikzlIVbYRTUEB1wzTYH8bPX62fqUeG
         CqIFq/bA+AeFiXnUtK1TzO3Er5JtYnw5xUcYMOjjc+ax4p8o905lrC8ZhPu2n6qiuCMi
         O7qg==
X-Forwarded-Encrypted: i=1; AL+hErHCuDp3eB2IUNIh/3hDrImlcfyErmamPjpcRZVVVFi6AaA5A/IPHQtFpm5aiwQClCcAoyEhrFSDMJU62l7Lsd+4@vger.kernel.org
X-Gm-Message-State: APuU4Z/cmHQI9KFFoPcvzLjF8CvN5L9h75OuH1OCFo1v5k8x4vCKd4+C
	jvSs7b8f5gHASM0fuKVCv13nLnM56qLrlGuUQn/WvXiDBRmVsx3mBVVan+ocK0n2GAQymVioSM5
	asyUTY4Za+MzIgK2GMDdI7XD0aWTKsoSltM+RsA793FkFlWlQ53tPUh3v18WpHlDKvwC06kSv
X-Gm-Gg: AZFdTZd1KPP/AHPy8hAhbt52AReyEZCS0PLew/TkIRCTbTNRZJ6AnLEt4X5h8oJj1fk
	C7DPbwej8hKeoVGjqA5UYPQP/2d1l2WEdl7MFM5q169fBoYIo/qIkoVdV9X83CAilXwrgGWi/I/
	OJeHjjE4D0M8IjtWPGLA1xZJWjHXv24RqSSz46bi6ixS/eFIFLq8nvfmjTfKGksMlLg2nYvmAbG
	R/xlPh5YHMf7f6Y6lLuuSldu/agQwdp2+wDUmWDd5bsJLvI+CUGGVt/TDoyv1RnUA/uDZ8V+C8Z
	5UgAXdUdiPK8Z9Of98sdoegrCuU6FJN2bB0/L1iqlpGdWOrXvJkK7fQ2LLRG7Hi794sXF/XkvRo
	UO+NZ9qmAdcmO0WFXE03cVTBAvFmcNYtYWgP9Mbg/ziS7t8rc2KnsL/62G/vdJCQk/m10tLMUYb
	Px
X-Received: by 2002:a17:90b:5343:b0:3b3:cae0:2b6c with SMTP id 98e67ed59e1d1-3b3cae02e34mr710838a91.34.1794930738184;
        Tue, 17 Nov 2026 07:52:18 -0800 (PST)
X-Received: by 2002:a17:90b:5343:b0:3b3:cae0:2b6c with SMTP id 98e67ed59e1d1-3b3cae02e34mr710809a91.34.1794930737651;
        Tue, 17 Nov 2026 07:52:17 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac292c53sm4601441a91.7.2026.11.17.07.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:52:17 -0800 (PST)
Date: Tue, 17 Nov 2026 21:22:08 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: remoteproc: Move iommus constraint
 to SoC-specific bindings
Message-ID: <20261117155208.wbnm2hldjrfomryh@hu-mojha-hyd.qualcomm.com>
References: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
 <20261113-shikra-el2-v5-1-8aca743de97f@oss.qualcomm.com>
 <20261116-boisterous-ancient-macaw-8cc00e@quoll>
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
In-Reply-To: <20261116-boisterous-ancient-macaw-8cc00e@quoll>
X-Proofpoint-ORIG-GUID: A4zX5x6n7EGAHuFxQxDbOJxVEj1OzCY1
X-Proofpoint-GUID: A4zX5x6n7EGAHuFxQxDbOJxVEj1OzCY1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MyBTYWx0ZWRfX3U4WH2AqzGIM
 lo3RsJ6amM9mCphnCQpjP06tsRUWE0vhltyyUCHSizA/VEV/QIEWNnfGQUZaSol2vWIy7Ug+blU
 VBqUuc1ZXAWbsyZpYKiokvBUSJJC7IF38H4XRFekpfcS8i34KLvP8IhF89HdBWILRoW1pkDLXop
 yd3IfL/vU1iKuHqdqaZGJgTPx+cIHS5Xm5Wlp6oFbNb4qpyS2pdywhvJsQG4ajB67hXp8ykAdtq
 59fGACeSFWulct0rHZxdFO64FHDw1iGRS1mNMYR2tvae3DneaAQsj2N+Ljg6bOb1GJ1I1z7WKrT
 LRdPyx2IIeF5GyBEVlekrDqxJ/PmqE0TOIcu9yVEzg/syJSvapSgZi5PLJPK0XoO3cits5kZAom
 UfiOuLlAFOHI3Jr2VDovV2Q1J7/3m01w6HPW4bt2GoJYQk4JNiHUU+xDQzOUN+03jTQHrMxFfdl
 g8Mb69Qbfc6GPGPCWRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MyBTYWx0ZWRfX1KQSBlqdh9Gc
 KpeeczMmQ09g1fCxjlHJQa9Tw/SghvW5p+euo2Up6yPOCKeIPVl/kUVxgt/75ykII7S064Uv+jg
 +uLJjl6yaQQuqmaoolB9YiIGzLHGZEo=
X-Authority-Analysis: v=2.4 cv=d5xgWhjE c=1 sm=1 tr=0 ts=6afc7832 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=mipXywydoeeVaK3_k7YA:9 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170063

On Mon, Nov 16, 2026 at 11:58:20AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Nov 13, 2026 at 08:02:20PM +0530, Komal Bajaj wrote:
> > qcom,pas-common.yaml limits iommus to a single entry for every PAS
> > remoteproc, which is too restrictive for SoCs whose firmware uses
> > multiple IOMMU streams.
> > 
> > Drop iommus from common binding and let each SoC-specific binding declare
> > it with its own limits. These bindings set unevaluatedProperties: false,
> > so a compatible that does not declare iommus rejects it. Declare it for
> 
> I do not understand this sentence. Compatible cannot declare iommus, but
> anyway the bindings do not reject it.

@Komal,

Yeah, this patch should prepare for the 2nd patch, so ideally this should
be a no functional change patch. Any constraints change should be a
separate change. So, ideally, this should be removing from the common PAS
and adding it to every SoC PAS YAML that inherits qcom,pas-common.yaml.


-Mukesh

-- 
-Mukesh Ojha
