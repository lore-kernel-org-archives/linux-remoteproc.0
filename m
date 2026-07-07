Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C75C3B6C11
	for <linux-remoteproc@vger.kernel.org>; Tue,  7 Jul 2026 07:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783409924; cv=none; b=GGghupv866Gu4y8/0mG7XzlnOU3gsdg4eGu4CfBCSZ8BErNq7gH7E+JWTnKTzdd1OMmZyf7sn2PZTCEAM1dgpecqv0oFwTLcOhO1CvL5gEbg78FNhe6hFk0TYBHv2E5m/as4Fz+dm1S7hMEypsqDwqIRraEb2oLGpj6pGw/gDwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783409924; c=relaxed/simple;
	bh=/XtzSDe5f5CGsYD8iKRTqbppL5zjqjNfhNi8d7rmSq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bG+eQsfecFYkhTcWLmkX5N23crnCxurgC5TB+o3NdA5nKDsd4R/6U8J3FGWDtP/V6ajjcQYFlwzOWGOTBug1lLQI4bH2b2kkSEGypSEXzVNPCEjKYHrL4KmwFE53B1gTJqRf0+tJODoI9PLut0u9B9dqUDyoaIDnAsAyGVUW5cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ix9H5hi/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dgC7pnZZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ix9H5hi/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dgC7pnZZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748lD42649148
	for <linux-remoteproc@vger.kernel.org>; Tue, 7 Jul 2026 07:38:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E2jWfFrNaZAaGPBLeNXR6DFnMGlEdizAPwinA4p0bmc=; b=Ix9H5hi/FvnjkhJM
	CgvTpORMh+WDDvscVJdY/s7m22myvU/XwPPelbKLA9m4tMIpAJCzXeQiiZEPUxgh
	e9Ewksvgo6vxDgGM/wEg2IZROirGyTznKQdO6XRJkCo05/N4raLV7/WvNdQiBGyH
	EX2/iMQerrQsT1yxjrOfxeVa6pvdU8H8TezaVJQqEIpA1NhU3LIH2yvKJVIYTqCQ
	LwgTh/Fa89xRdmEnPLWD1lm7+SN4Kakcyx5QER2spADbJ/NgmIt6J90hkgHHoMVi
	ESRg6rewBEddvobEMKLDCChGg2WpfmBiJZNBOE3PdloOg1skpfSU43Jblyt5ogTe
	otxCyA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8fdw35us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2026 07:38:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381e93bfcacso8595280a91.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2026 00:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783409922; x=1784014722; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E2jWfFrNaZAaGPBLeNXR6DFnMGlEdizAPwinA4p0bmc=;
        b=dgC7pnZZWnaeBzpNdkgpQQMfpuzGsxn0AByvQmo5DNQEi6vjHEi4fYikYyj7jkLJW0
         L9H2yvYXCdER81yS7gqSautgUkmz0xECX2gZYWEheAinpb9gHjDMyMTxV7boIMa+vtA7
         zdyONtLKaBqtHBIB8pxb00Q5MYXyzpZT75c7hQrYkAYi9UQLDvioEW0fpa16JAix7/jY
         pXbk8eU8EaRgdsYcueFufcTNx2Ys8YuVIHNFaAqqtJKIR2VEtS91kucoIaVB/jtB8XjN
         2YamFsQDkfjXRcOnpSKB8Ihv0CigDe2pIav3DzsMak9kPmdE/9sLr1eWj2e0yFgKlq9W
         KSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783409922; x=1784014722;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E2jWfFrNaZAaGPBLeNXR6DFnMGlEdizAPwinA4p0bmc=;
        b=TWTb3v7TjgqgwG+Gjz+yPnM5MUBB6P/DXF76rsNnsa4/52Hk1scT4BAaa2GBWb2anq
         tg/Dy6FXUrWhVU7SRQMMjD7E116y/aWNPxt7j+7697422VFKSGrWhT89hHdTLPQ/edXT
         Rx0mvB3KHR6g+ihl4OsDEU1vVq4z1O/9VG+LmDKlw48RuYzrulnh0txYw0a229aQUgZ1
         l6qnvNdB4ruK4IO0k1XYSD5GhZRAz9inGZ47SLBfpk8MFp9UeJUVtMnUK33WXvpgTkB9
         NVDJdO7Qlx09C2p9gDDvRI1mf6yEFdauuGsDuuM2wRjVuh9EaMi/OXj0NFhiPRbmJCwT
         vk1A==
X-Forwarded-Encrypted: i=1; AHgh+RrF9udsJevV8jPTHPJVii1dkHDKbrfTDFQtT0Jug/WI58GMcNGJXfX/azazsyPsAD7IqitxGOx4xQyfJttjMBCH@vger.kernel.org
X-Gm-Message-State: AOJu0YzSzPGZLUVokUAIHLgsdyFxhMZU+KEc7h3YWMHfCrtvJ20xBl/h
	bBeyFIabmtLDwmNkS2Q/Q+ouM6pH4JGzTDGyL5fekp/7TrnMDdx2bDt9cveed/big1apS6jYaAL
	CNP792d17jKHN5/wYPBZM/JWgFJ1YRxQsSL3FGX972ZRZM8bGn2JC+DnkqDNQFfM6uETEKum/
X-Gm-Gg: AfdE7cnr7qxkeAE8wzhSzyiKZJwUNJcCS7D0xovtngj8Tr7r6zljWk+17FY2bMmbWgZ
	JtVvA0cr9lqrfgAxHFwOExSB+cd0/A7X4lxed3MUCp3wj+HR+kvJqo/Pnn6dfndZYO9A7aqCGfu
	mwZWicCF1Ap7pz32HdwYiw9SxvMD8JDSI3tjdHdxTF9DQHuwdeY7fqVXK/YG+KtMo5XlCAMI7rg
	mF4ULClOap3S+lMtlAsL/gDTmWMXzXXcSr647EW7Q6pu+wkbhZtYPUHGybnKGTw91i8ORz9GDMS
	ODp+hkuQvJnNfAtFLXeawR4NBfyXXFrmGJ83fz+melYUt5phv6JWov3V8pMEebpORptygkt447z
	MFiaF9Lm90N6RUg70xt/a7V+qM4nA3VP1wOHQHA==
X-Received: by 2002:a05:6a20:db0a:b0:3bf:6edd:4dfb with SMTP id adf61e73a8af0-3c08ec76ebcmr5246929637.5.1783409921817;
        Tue, 07 Jul 2026 00:38:41 -0700 (PDT)
X-Received: by 2002:a05:6a20:db0a:b0:3bf:6edd:4dfb with SMTP id adf61e73a8af0-3c08ec76ebcmr5246882637.5.1783409921231;
        Tue, 07 Jul 2026 00:38:41 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm7670408c88.14.2026.07.07.00.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:38:40 -0700 (PDT)
Date: Tue, 7 Jul 2026 13:08:35 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 6/6] firmware: qcom: scm: introduce keep_mdt_buf flag
 in PAS context
Message-ID: <20260707073835.ycluj4t3stxldw2i@hu-mojha-hyd.qualcomm.com>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
 <20260430191253.4052025-7-mukesh.ojha@oss.qualcomm.com>
 <yg75raxv5nlbcg4jwytba2ijqe4qsrutw3i4xtc6sxenbnaxqk@fnutisnlywf6>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yg75raxv5nlbcg4jwytba2ijqe4qsrutw3i4xtc6sxenbnaxqk@fnutisnlywf6>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA3MiBTYWx0ZWRfX6ZWuhAe+hQT/
 vTZ1zYjLKj0rYCPChhE2jKo+DXfD8RneVx19/yk1Zv5XSnBEt6eW2Y47ZBTAz7cKdeOTtOrBeh2
 mm8qt5VOhyIIzWxPuQRHpVQOJnGgSIE=
X-Proofpoint-ORIG-GUID: 5KLnmesJ9JgL8U5YNdeLECL9qG7QdtpS
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4cad02 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=ZEZ9fIX7oo3zG9G1BFQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA3MiBTYWx0ZWRfX6RomF4rHzWNZ
 DdYfNYexXOnjmkymPZ2YX/kZrC0I6/vI9ZJ50fsvBQZ1cYY85lTiaRLdB4iOuXVXV7Y9wJLOLoY
 r9yEFHpHIMhERqO4bbtCG4Y3nlfY7Wnlc6uzEQWEpQmAiAqGAhwDtbJFZvJsulrh9OmhIBLMdZX
 NaX+BHKjuKVEQl87t4MFQDA3z0ME1WECcSfGdCYZBw2IPk5mFU6c646vSUXEhWN03AxpfMttCIj
 T0KARSbYkVoIiRKLzkTvsJ0Nps18lCYffHoiAG93kLQgyYgFvohqh3yGTYfmIbLyi7q23cv9T9D
 AmKIiykjxdfIhRH4tk03NJpu0WNl84MkRAZCxT+pAp1Yf8NDowZ9DVtdNnxnmk7XZzE9Dr5OUCv
 LbxjlgjLAAfsCL4bpYM0AHAffIX+RiN69CCpktkOoxG9UZR1KWweQuITHmiSpk2zGpBylUPqG8u
 4IvLgnABdUBbehprRqw==
X-Proofpoint-GUID: 5KLnmesJ9JgL8U5YNdeLECL9qG7QdtpS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070072

On Mon, Jul 06, 2026 at 09:13:22PM +0300, Dmitry Baryshkov wrote:
> On Fri, May 01, 2026 at 12:42:53AM +0530, Mukesh Ojha wrote:
> > The PAS image initialization path always retains the metadata buffer
> > when a valid qcom_scm_pas_context is provided, even if the caller does
> > not require it. This implicit behavior leads to unclear buffer ownership
> > and forces new users of qcom_mdt_pas_load() to manually release
> > metadata, which is error‑ prone and incorrect.
> > 
> > Add a keep_mdt_buf flag to struct qcom_scm_pas_context to make metadata
> > retention explicit.  Metadata buffers are now freed by default and are
> > only preserved when this flag is set. qcom_q6v5_pas enables this during
> > probe for contexts that require retained metadata for subsequent PAS
> > operations, while existing callers continue to work unchanged.
> 
> Would it make sense to make new API backwards-compatible, so that we
> dont' need to touch other drivers at the same time? It probably means
> adding ->free_mdt_buf flag rather than keep_mdt_buf.

Only remoteproc peripherals need to set the flag and do the
release call later, while the rest of the clients like Iris, IPA,
etc. do not need to set the flag, which is aligned with backward
compatibility for non-rproc clients where their metadata memory
gets freed in the same call where it was allocated.

free_mdt_buf does not look suitable, at least name-wise, for the
reason that now I need to add this change to set this flag for
all non-rproc clients, while with keep_mdt_buf, just rproc
drivers need to set this flag which will make this backword
compatible .

-- 
-Mukesh Ojha
