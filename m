Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B99C278E47
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 00:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769732471; cv=none; b=LtYY69TW5i6UajRomlntbkDETClw0WdvkJTcxOIa4FEDRwMJxZN7tu3KAiI1sg6c1EWOvAqcTU+93d3agf854GbJ+ENGI4XV2DlfvsY6wHY/BX2WVtHvTSzqyNBmylcy3wBNjWyIV6koVN01pSmV2fRnOGzugj3XutSD9HYWTS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769732471; c=relaxed/simple;
	bh=nbJBIm15Ji1XwKk/v/G/rXONVRy1EyJBStzCCuIeyac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ufUcsxGLlmHw3PG8QLhPifN3mgyEpDMJaHzzsuHWE9fB066nwcR35xaH3iI854/uobELhDy9f4PKMfIXBTei3yP7AU7eiRVivDVN/Ni//vK/YjmXGHAnlt2mMBLdF2kS1jafsH4uHKPfZrIlOoOcrSAeTv1hYpa54+9/+glfQSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bELdswTa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iBnEP0bE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bELdswTa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iBnEP0bE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60THM2fu3915417
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 00:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iRA2nAXRxz5YrufMBs5S030c
	Uo0x/I8unim1ur6B/e8=; b=bELdswTaQxcWnLmEgsaDIWLX1MYVNkJcANsO34FF
	DecrEX9YtKlVy63Q9m1pe/O/RRTXs1u25UNsVS4iKTj/MOzrkL9ffrc1VqyLm9Pf
	QOXiA8bud6NKuQmX1j53bbmYi4JJaGJIZHsWvp1ev3cEGBpBDVFX36SAK1jgftep
	n/VBE/vQX33x82LdgBJe9fc1UVcqivvcnyaMPGNZZi5p9AbFls+J4spcr4b9+k4M
	8fzWYHL4Y67BWWfDBJWmbVL4u6YO5vdJ8A4tCl669ywfGALaJ28JF1ccIWcZbgYO
	zvc/hqBndqBgGxW6dgFUkdi7GF98JZ9/kJ3RdRQAxp5Wlw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0bvvh3qs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 00:21:09 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b795cff830so8869541eec.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 29 Jan 2026 16:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769732468; x=1770337268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iRA2nAXRxz5YrufMBs5S030cUo0x/I8unim1ur6B/e8=;
        b=iBnEP0bEyja2nF2rOAr/+ktobXHn2gXsa6jeds+ZONC7OshQyo3I71t8y3w6+OWLnm
         ddDueOOopWky+pfVzCGgL9i0pGIR5fTJsU1T3o9yCJD6qdZcI4iMWJKdGOYvyS/RkDUR
         qgfTk+SxWgUDPfWCZop8so+jTNhve0EES+V3d1/l+tnq/cLQjf6Iim1uC7qEr/mLgBFg
         mlMpY+IjqAIqXLJWA+zY212Zrjl6CmPVCUi89HKw3T/ChXphKS2dXl+wmewsY/4UqzCD
         paKkmkczQP02/OxFUN+kjqpA8S/d2UGqVWzvHDp5GbySrUQDbSN/ECwCLFZehC2UOpr7
         PeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769732468; x=1770337268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRA2nAXRxz5YrufMBs5S030cUo0x/I8unim1ur6B/e8=;
        b=DdnvmTKNRHE6CWXgT5NxMeI5sNi+oEroYvYn2XrOaz5JmsgXH393hLFVLA+G8FzOYj
         nj45JIXZDN9IJdX1JOYxkNV8PDNAeisZaWtEklyC/NbQXMXmTP8eLBdWQ55BQuddMqo3
         4GPIUCvd4Pch74slSOAZSRRL7Wr29Uq45QoEbj1QAJdaWbjF0owXquXzTBY301aCO4PO
         WOo+we3mE7xGiX12I8gJBfbf6E0b+pFFUkczTWQ0Skf4oasqoTCb/lQKGonSvgbNBHMJ
         1Lel+YuYU71TpvE9gF7GY1JU8sNmRgoUKFvj/1VXpnu4UStBeGsA8xFtF5ntd1gnrDZA
         P7NA==
X-Forwarded-Encrypted: i=1; AJvYcCUEBx6Dyaatx+elnwGYe5lUVv3KqrR7XAfMh2MaFtcWvvUG8L5MjQ9Cuz4G6eFLEHEBp1YInu/NuO5Ksw3Xk4D4@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk+ZpeAovfdd6qVJokQCteX/G8LQ6y8zX1scDAZOJQAUUVBpo+
	zgEOky9AtfwKBTIWep0TH7M7bYZy58jGDKC9zeJ0q1RxTy2GHN7kdNIcXleoSw0En0vjMlg22Iz
	9+9eW9yO1l3rSJnbFxS7d4KPxC0D168oL4A9WEdyj5/sdJRHNhuOQ+Ijvae3v0GR15nowPmhO
X-Gm-Gg: AZuq6aJ5KXTtr8xV4xzOCzE6Cg11+LlziChzGNfjchUhCY1pMqzGtyKDjPu195E7REB
	Ku9nFsxFBIn4who4C7jlmnCZnFRuC2BFK/h+V1K0FflNFmb7WsaAWHZWg1/C/4I8Cx0gYexNQQS
	1unRjB/KHIZa+m2Dp6XDoem7qw+h7vGqvh1MsvqZeG0569IhEyLeduI5zWqJQ4WvWQ21OfXZcjz
	svkJ12wpHw/Uqnwar2Q/1aecZu5IyVjKxgtLLGdFttmGI1D86ZMurom3Qyqkfyfkh9tp6MEBkio
	XorQUyl5fNhccGOZySRVry7AVswD5j769iDf7r/KWNDac5KGbOa3HbStBlACvt6/Smi7vbs5/vB
	5mU3AySYDvRv+lbwQPTHqnBCEwXVt6g4uN1JHiaXDxDS3PuQ05n3uLaQ49bwOm24=
X-Received: by 2002:a05:7300:f193:b0:2ae:53da:9787 with SMTP id 5a478bee46e88-2b7c89507ddmr453393eec.40.1769732467875;
        Thu, 29 Jan 2026 16:21:07 -0800 (PST)
X-Received: by 2002:a05:7300:f193:b0:2ae:53da:9787 with SMTP id 5a478bee46e88-2b7c89507ddmr453378eec.40.1769732467302;
        Thu, 29 Jan 2026 16:21:07 -0800 (PST)
Received: from hu-clew-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1af8ac0sm9018117eec.35.2026.01.29.16.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 16:21:06 -0800 (PST)
Date: Thu, 29 Jan 2026 16:21:05 -0800
From: Chris Lew <christopher.lew@oss.qualcomm.com>
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, corbet@lwn.net,
        rusty@rustcorp.com.au, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/5] rpmsg: core: Fix incorrect return value documentation
Message-ID: <aXv5caIoE7DXMlP+@hu-clew-lv.qualcomm.com>
References: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
 <20251217065112.18392-3-zhongqiu.han@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217065112.18392-3-zhongqiu.han@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ZdEQ98VA c=1 sm=1 tr=0 ts=697bf975 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QRj5kXCQZoiapl6m6psA:9
 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: MFIGb5JPzWTL8V3CoxfL4Lul2IIYjmPH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAwMCBTYWx0ZWRfXzC262iFLH6f/
 qYuPJCrvCOklFPVv6UfpzwyBz3mm36DGF2F0Yyx5TcsND+/22vDc2dTNsukN8s2Lhmlt5vYFoyW
 gyUd8UaHFs3vY25jd3/jvbTSmul+CzYsAXRAeZ8t0Ggm9K5n5xPhJ7Vur36QpvRUOOMXf1xHLXn
 /Mf56Gn3x1QzUYZMk4eCPA+q9MmBXiPy1pEsL8RgCXqs/NBjiq7muB1lJFD+5RdDrajK+vzQ+gm
 WvlOcMSkFWck32CZDavsvhtziPLPmk18qCscFqH4B0fa1gqjCjqSsfrbdi45781ndehTOI2ecBW
 01Jo+h5mXKWEqADcLlyxgjBYAy/3ojhlIJ8owGtBK5w5UCn0LrSHXNJDDOmrjAaFc3xBmug9zfT
 ZApBztz5TRy4AaXcUUTsxucjRxGyF9efJfcn32ZJVcvHoTXwOVfoV1AIPp72YF+smxqzML3oQvZ
 2D0V/ThSs4d5q7Q3V3g==
X-Proofpoint-ORIG-GUID: MFIGb5JPzWTL8V3CoxfL4Lul2IIYjmPH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300000

On Wed, Dec 17, 2025 at 02:51:09PM +0800, Zhongqiu Han wrote:
> The unregister_rpmsg_driver() function has a void return type but the
> documentation incorrectly described a return value. Remove the incorrect
> return value documentation to match the actual function signature.
> 
> Fixes: bcabbccabffe ("rpmsg: add virtio-based remote processor messaging bus")
> Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
> ---
>  Documentation/staging/rpmsg.rst | 1 -
>  drivers/rpmsg/rpmsg_core.c      | 2 --
>  2 files changed, 3 deletions(-)
> 

Reviewed-by: Chris Lew <christopher.lew@oss.qualcomm.com>

