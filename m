Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4B9311969
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2026 15:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782143460; cv=none; b=hrlVN+oxdRa/m6WjVLe0xfMSVa+98zdDxaUoWp/havd6GBGCPIe2GgMxrY/WKe8fPCniR1U8L2s7xi+uk2RZP7vgEcwT0KcdHfDMwBGrg4zBlS/pY0GMpdof0n7U5cWghPVMZirPmjxNWKoQlywlYYrr2bhFrFCXkqpdcppSjmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782143460; c=relaxed/simple;
	bh=YUr/EDfqhlUBd7GzzTUmu31ihTNj2fyZnm0Q69R8Wps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dbadcxMemEDQj6rXOGe7EcuRkxmwNP0/eEd/ZSkvOPLFwZ7pzcF3UeRyjBvaOAxUq+jeZSbxxR4vP2dIuxiazak4XNwk73IcKYSIhdFO9eGax/6IqE58TMVKOeFeN6lKVjDq3n3tZbPh8/R38FdmKIQt3kLg4lAa8tW9caUIY1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kFkUdldc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EM1dpGWP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kFkUdldc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EM1dpGWP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MFXKEw1571257
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2026 15:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LFwruN8t4Ou5IEqGe/3xdJLo
	az/ZKII1FGmDkOw7dSI=; b=kFkUdldciq4Pv/mNc/7fEJgG5CJgyUc5E501BjRy
	QVChqFDfp9cmjuCE7V/1/lkwA+6yahBjjbpVlbk166+T9Hvbah9MOObcz/zhKEEJ
	QRLQVzcVQkjLOlBa8V7ncZwA2SdknX6/RN0HNSt4qS3S0fO1D/Xi2Uarx1YtjEd2
	59lh3LRdizkNcAmJt3q2g4hsd9QY4VkSP6iNr7zsJYjPUvhDU2ufURc9xRp7OB9U
	05edcEfQG2qOurJFkc9WKx6f7SxqebIi//zAaAX4wrVNW+nv+xrWCSOEemAQyIEY
	ltMeGeNCP8CWILZ5M1Nk4eJrJZSQSuVojYSQ9Cp6GhZUQg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3eb93n5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2026 15:50:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0b1bb53a8so130255ad.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2026 08:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782143457; x=1782748257; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LFwruN8t4Ou5IEqGe/3xdJLoaz/ZKII1FGmDkOw7dSI=;
        b=EM1dpGWPp3L3V38d4yeMFivl2E0l/dw1A3PrFCGCEzUSvgtTGuRz6F37XgbYf/9Aaw
         6M7IRWLr09OPEob5AXcefo9zIFRJL8N1BAte/JCQWh8CIxK8uKAb3A/onQGTPnE1DiaR
         aKl0qbZvl6cm1dOEMAliz4gvVDmXqiHTFergTZoEPNHhx6QOAJuQKXXPgfDvcCbu46bn
         L+dhxW1LTxeX71VOnvAZqNTq44OPv1sXSCZCt98B2bbC63icj8Hl9Xy1vXG/NpPk+AUR
         ohq8I3HMUDfVhLgNpiQWB7lwLJ/79QxN/xJJf0/Aqc7+RlGitPXfzsaX6JA4QuEbSBhA
         HOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782143457; x=1782748257;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LFwruN8t4Ou5IEqGe/3xdJLoaz/ZKII1FGmDkOw7dSI=;
        b=i6fcGywK3r4YBoyCLyAXia5hWmndawZaxB5k53jsL5rDpwNcJVPM4NYZ77RT038Klo
         wjjdxZd6zaUJ7dKhV8Z69YabinT4r9cQhGHIUz+WmETjk3vD3A+SPvWDkDtWEkSEIqMO
         BOSvLfV9BLC2so9jSMisxWicg76ODvduPPKX5SU5V9x4KTwG3ywZcy7Oocf57n9HE20j
         n4sOeW6tiyj9Oy3c9CjysO9nqHmz9EQ+NAD1XIRNyGAltyxDuISq0nbr1COwKNhAMOS7
         5QpVJOju7hjT6MWHUc96EmTxNWE9QnY6ozuZX5YHcxS1J/Pw+ozD+0SkNtHVozWEEJBW
         7RuA==
X-Forwarded-Encrypted: i=1; AHgh+Rq+oW//dp03w3c8cHhRZFYjgJRHCAlFWdFDd4DhaPdvyk7R4K7Zdyy07Na0AWfVJtO7mDJdn7IVtmCTO31xtqo3@vger.kernel.org
X-Gm-Message-State: AOJu0YzUG1i5Svr6mu4BhTrCun9kke6qsixfU4Wnbmzz9kKM5C987q67
	XvqLNvofVcH4w8xHkSpx+h7wQpW9QEy890OGMEh3k8xCr3bTZvqmQ2HoX4fY6PTRQrmgT2wf4WS
	h2F1RnjThU31nWSPecvOhi+AiANWu3atKgQ26ZqkiXeNKRn2UovqRIUqEC6g+0nKGSXqYZloY
X-Gm-Gg: AfdE7clNkIOTfbNxv1jw7ZkNMxQWYZ1Eu3HlAPlH6AGRDE/eYWZgBl62zGWyg5Tw6R8
	/EzWC1TDRMZ+TnyWYPceMniBU3jfPxrrQ8sSYlyuSHZO32sbpavtE8vWq0LTvHlLirmdKiCi/wc
	RDq3YJN2VMwWPFo6/oVoaL1BHlHuV1e7Y4l8XCvYwXA3Kn+gRzD+ho/TpuLfN27099YiZIW1x6U
	KH1bUYTRFwZFBQgaYfWd398/++K5g2V1yKH+k5/BxjpkR0GE6yVtMiYiTVe2klDQ9D5c3B+c556
	JU9z702MEs3UZ4RZl1Zh/fsNv4XF1Yu/eSIXlzCkh1CpVS8mTxvPWp7tT2hMUREPoP+OiBtyTxq
	U66vMZkQ4pTld1xsEfAd1fZeMKXayuxcYbJLr/w==
X-Received: by 2002:a17:903:28e:b0:2c0:af11:5cef with SMTP id d9443c01a7336-2c7c3edc1d4mr152145ad.15.1782143456967;
        Mon, 22 Jun 2026 08:50:56 -0700 (PDT)
X-Received: by 2002:a17:903:28e:b0:2c0:af11:5cef with SMTP id d9443c01a7336-2c7c3edc1d4mr151835ad.15.1782143456343;
        Mon, 22 Jun 2026 08:50:56 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c743bfe441sm83075755ad.62.2026.06.22.08.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 08:50:55 -0700 (PDT)
Date: Mon, 22 Jun 2026 21:20:50 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 1/6] remoteproc: qcom: fix sparse warnings for __iomem
 annotated mem_region
Message-ID: <20260622155050.yvgffdapdjb5f4fh@hu-mojha-hyd.qualcomm.com>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
 <20260430191253.4052025-2-mukesh.ojha@oss.qualcomm.com>
 <62c91b74-ca1b-44be-8771-669aa686ddbe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62c91b74-ca1b-44be-8771-669aa686ddbe@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE1NyBTYWx0ZWRfX8YAFI6cHdTcj
 ts1BT2yAbhKfumr44A+CAkXw08gsV9+RO23MhktrbUy0CU7kF3NteTK5KThE+5ys2JhHq9LYPIH
 PCo3CbmwMpBgZsyiWRRSk7RVSKbBklA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE1NyBTYWx0ZWRfX+NaIKmqTW8vp
 srUd8MGfKE4DZO4/DmTOsnVRESXcJ1yAAH/E/qhgtSqoQjLq78SBaYVGdk9Ko3AHE6m5SkZA6Xe
 CnP1GIBVQSK44ObtPvA1VqFrdrNKZxHkiQQ9HB4lIm1yoKxhG5AZ9KuH0DZenDylRm0p6dtNtY7
 1d3xyZVvqytgP8x6K5C8tNZksHegnF7fJhmzP9AqJiTrIVW+aiI5ppFh90l4HsMJbEL2ZH5W15R
 sdmgYI8/RjlnWmo2lGepvQ9GJmr/oDWkvcmuc+MWi8Oik7oiH1vTtMeqVTnS0Q7X7FIPfCqA8Hg
 d8faI92+ZrprNTw9B96UVJLz2DwKPkzWtlNFIFRL2pQ90zewUDolfN57Q/9Ai5VK4whAFHIMT0k
 NqJ7iZ7kNlvDNyYMfU+CxWTYC4t2va1G6uwpRR/qCDTX9fKOCaU9cf3/k+SGpifa6Vzcw7fLevH
 ZiVTnGY3Fp3yN9yVdvg==
X-Authority-Analysis: v=2.4 cv=ILIyzAvG c=1 sm=1 tr=0 ts=6a3959e2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Leim0v9d-cC2b6exvXIA:9 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ksSl7WN9dMZ_omSxgIe0F6IWS_4k0wHB
X-Proofpoint-ORIG-GUID: ksSl7WN9dMZ_omSxgIe0F6IWS_4k0wHB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220157

On Thu, Jun 18, 2026 at 03:53:22PM +0200, Konrad Dybcio wrote:
> On 4/30/26 9:12 PM, Mukesh Ojha wrote:
> > The firmware memory regions in qcom_adsp, qcom_pas and qcom_wcnss are
> > mapped using devm_ioremap_wc() / devm_ioremap_resource_wc(), which
> > return void __iomem *. However, the mem_region (and dtb_mem_region)
> > fields in the respective driver structs were declared as plain void *,
> > causing sparse to flag address space mismatches:
> > 
> > qcom_q6v5_adsp.c:639:26: warning: incorrect type in assignment (different address spaces)
> > qcom_q6v5_adsp.c:639:26:    expected void *mem_region
> > qcom_q6v5_adsp.c:639:26:    got void [noderef] __iomem *
> > qcom_q6v5_pas.c:141:45: warning: incorrect type in argument 2 (different address spaces)
> > qcom_q6v5_pas.c:141:45:    expected void const volatile [noderef] __iomem *src
> > qcom_q6v5_pas.c:141:45:    got void *
> > qcom_q6v5_pas.c:637:25: warning: incorrect type in assignment (different address spaces)
> > qcom_q6v5_pas.c:637:25:    expected void *mem_region
> > qcom_q6v5_pas.c:637:25:    got void [noderef] __iomem *
> > qcom_q6v5_pas.c:654:29: warning: incorrect type in assignment (different address spaces)
> > qcom_q6v5_pas.c:654:29:    expected void *dtb_mem_region
> > qcom_q6v5_pas.c:654:29:    got void [noderef] __iomem *
> > qcom_wcnss.c:540:27: warning: incorrect type in assignment (different address spaces)
> > qcom_wcnss.c:540:27:    expected void *mem_region
> > qcom_wcnss.c:540:27:    got void [noderef] __iomem *
> > 
> > Fix this by annotating the struct fields with __iomem to correctly
> > reflect the address space of the underlying mapping.
> > 
> > These regions are subsequently passed to qcom_mdt_load(),
> > qcom_mdt_load_no_init() and qcom_mdt_pas_load(), all of which take
> > void * and use plain memcpy()/memset() internally to write firmware
> > segments into the region. This is intentional and safe: the mappings
> > are write-combining (WC), which on arm64 permits bulk CPU stores
> > without requiring the memcpy_toio()/memset_io() accessors. Changing
> > the MDT loader API to accept void __iomem * would be a more invasive
> > change and would affect callers.
> 
> Zooming out a bit more, should we even be ioremapping these regions
> in the first place? Are they not just RAM/Normal Memory in arm parlance?

Yes, ioremap may not be required. Don't know why it was kept in the
initial implementation, as for most Qualcomm SoCs this is going to be
normal RAM and not SRAM or something, while other implementations like
qcom_q6v5_mss still use memremap with MEMREMAP_WC.

> 
> Would switching to devm_memremap(, MEMREMAP_WC) (like we do in RMTFS
> today) be an even better solution here?

This looks fine and I do not see any immediate impact; however, I would
like to hear from Bjorn on this, if there is any history..

-- 
-Mukesh Ojha
