Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372AF2ECE93
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 08:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277743; cv=none; b=q1s9mOLpt1tr7J+vTwbMOLf8gXdu7fy2rVh4rJS3+e3H4dM3H5k31f5U+xuDeM/u+agdHBpiAucvGK2X3VzIlE766Ev1K7Uf+ycNvokPY/BxexGyzNNq9iOafnlSD9NW89/d138GywIGESZ/JLxM+IQ/KBqUVehLSjMt4XcHWRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277743; c=relaxed/simple;
	bh=Ug5IfIufd/F8tkTog7HZS//RCKPr5VJhuqnbPh/oOpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VzlzTc2LlPg9PohrG7zcTHXqLoa166I6E2RPFa3MKqeIWuW6HR0ZqcLhKIOk+OIzxkYEamNPlqAGVxqzhBVeCVirdJVvfHldSoj/buSjcta6wk/N2YqPW4jd9xW+h7N2xfvyJq7MDNoxJVmSBGLnTY9QQ4jKriAsdEad3s6z/no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eIZHdiNU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=avmWu92p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eIZHdiNU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="avmWu92p"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cfui1078357
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 08:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tDAoFsXchHDGsLbGyYQzswa5
	qoUFHTIgk2f6OWlaAgU=; b=eIZHdiNUDtmqDPqlnC7dOjYQmR0Up8wHDOCGLJ0j
	YzKTxWqHJupJAMcNu46AWaJP8muFExEX8KOUcPvYqJYJX1gsBOSbG7qH0/9pC4Ic
	qlXNK2deFdKzJfn/7UMRvFVfDShDRY9KqGtLRYWdJYldXNiO0xKcO96UMBmwRo2I
	M8Btaf/42gkLmcdsYOWUpNZEQbYMfPGxy6+tlJf/Q6pk2NC6wRE7lD5064+se31t
	a9isTctfSyz+TJqBDfQaWZSPOtRb+FVQOwoDXL0BjOMwbmgZvg+YFnYJTdC2xStJ
	HOh+w/XRqkReWwlkeya75k9EVtxRYgSKFtQz1tmFsupLcA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feym1c84n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 08:42:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc5faecf01so146831945ad.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 01:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277739; x=1784882539; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tDAoFsXchHDGsLbGyYQzswa5qoUFHTIgk2f6OWlaAgU=;
        b=avmWu92pKXQLX6kHJlzRyFvc5hA8rLcbvEUPtY2nZ8nRy35yj/6V/NK2AOP6CfrLPL
         X4z9XpVxXZc3/74OXXyaZpAkv4H6yWU0boxGYAUwCYWfhdS2//C1Ucrcz/dlrusU4jeB
         +voS1CI/lHCqUvVNLvnJiyPUh4Ldt5IVx2LyMBBzaN8H6S0DtQYTiDXtD2Jd8ZC+vAfL
         S738/V3Y6tom4PwdX3hUvCU8QgS6yaVquejlS3K+FJml+RutX6/pATKDp2iCRfNqbokx
         eEV0n9YEzqBtQskGnC/Xng75gmYls7wfMIV9AaYk2WjrsgCo2fdb9zg/ZXU5jSSNnG8p
         m7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277739; x=1784882539;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDAoFsXchHDGsLbGyYQzswa5qoUFHTIgk2f6OWlaAgU=;
        b=VPe4J8sH0w1moHIp4pRox+8YAG6c1dB/RTAQi3rvucQxARFQS8F+vpNjnQLijh5Ocu
         QOHLqmnW+lWQ6kfvIMtHkGcOvGUL4zGzKBQlgzbRdcHOi22ppuWCMQs3tA2efINEiklJ
         YzEWmN0F52m7+xuJcYl6Wdr8ZtFW3U25Bh3CyFU0S0fMRCZZZmqqgWt/ZrKERa7ilpax
         WssmJ1Qgt0DZq7PDNW2DjmP4emlOVz0dn7GC41MZlFTsMVk0R9eiul9/hmzoNSzZ9zzK
         AloW0E35d2wc11E8n6HO8xocbKrL6WZEvK1pkVJPU/fhKdwZXZy1xmhR284w3EUSDcI/
         kojA==
X-Forwarded-Encrypted: i=1; AHgh+RoXErgXexveegaYyvVX34tELrz824Kgn+JtqE5XoCyl7kMpHkOICNAWgI4uAyjn7H6aQrb+wVxb9simqQjbE0L2@vger.kernel.org
X-Gm-Message-State: AOJu0YxtkYfNd1K0qnG6gFgMBykoHfKz6UizYqGqytBTkMyPU9C0Zweg
	ikTsK4rTAZmJ+Bgol8I8bocNFAMGmieP61ln85e2FMNY72G7aRcVwuoC2TnkuzjH/NK4SBM+FG6
	rZmfodlJFLmdTWQ/LylA5/pBMkKK/lT0YP53y+L0oeroHM//KlHayt852rqegGWgVx74uTZBy
X-Gm-Gg: AfdE7cngidX9xfKc9rnLBanZd119kY4jtk0YuuuR0/YiBCUIF2ih/P32WEqM6gpX3M0
	G5I+rxZBu+3dfM2Pzmf0dC++V8drBk6okirIazasn3HUUJ172IaKIscShAdNRrVPcAGuqZKVr89
	72y6c/L1yCNhWidmV2w6uDnPFYpP5k1xjQWwfJPDd1GZetSIS9r37FtI1Ru1XJ13Nevlhbe6EDi
	/WwMu5MBnsGypML2MYRDVT80kNR3XTLGtdijE7KGqhMzQ1EHkM0Oo2DZerHtiWIQA79Xh1+rRu5
	6nZLUmCIosn3ofuPkjehRzasfzr8s9ICVm2fIUzvC6kRoXXUng9+1XtcuP/mbu689M7HRIe5RTA
	+a57r5Ln8dvwXay2eAAv8tv0wve5r/UjIgsww+OT3mX7E1CDXlA==
X-Received: by 2002:a05:6a20:9397:b0:3c3:9b44:982d with SMTP id adf61e73a8af0-3c3ad95dcecmr1670301637.42.1784277739029;
        Fri, 17 Jul 2026 01:42:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:9397:b0:3c3:9b44:982d with SMTP id adf61e73a8af0-3c3ad95dcecmr1670275637.42.1784277738498;
        Fri, 17 Jul 2026 01:42:18 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29c2a48sm2896833c88.2.2026.07.17.01.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:42:16 -0700 (PDT)
Date: Fri, 17 Jul 2026 01:42:14 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: fix SoCCP memory mappings for
 Glymur
Message-ID: <alnq5tDRRJWbloaS@hu-anancv-lv.qualcomm.com>
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
 <20260707-glymur-soccp-v5-2-053993f0c6fe@oss.qualcomm.com>
 <9e0ea6cf-ec91-4017-a14d-a1f7c4921f37@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e0ea6cf-ec91-4017-a14d-a1f7c4921f37@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KPRqylFo c=1 sm=1 tr=0 ts=6a59eaec cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=B7WZNfwjtREewDEN4H0A:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NSBTYWx0ZWRfXxJCj9X2y0jp2
 0+PsOjccruZhK/8Vgosu1qvqhHyJ/U1kotd6Y/LWBBRagEVAt6kSUKuojBbmHLZuMul7jHK8CFu
 uYSp1My8t0r7YvgSQ3k7YI2dJRhhUcC3sCKtIP8iP4+uPKtc+JGrmELNshx9K1O4fgfqpa/Z3pi
 t9Cu2YL5jvpl8cvAYDkIAm5ZY8qSpyFjehhA0VWiZjGSoY8Wya9nzoiWIJ4xsfbj7mcGry7Scq5
 ttL56QhrXzir2W/OjI5hSa0v1RezvYCRZwNKxJ+09D3TAMbetadKjQujIO9yXUmNLnEHegFpE/x
 ZsKWx0yWtCq2Ob5wiHN/TClCfEB3wwB58x10QZVqiaXVtF2Mf3BqraSR+NzcsCK6zI1Xlo/w2B5
 k0SLGrDn9c6cmJ7PNvzqAFHtMIQaD5DJD8zuH+ug4L8ydV2MQuf6tZDdoYqh2oggdawIqBBTNWG
 48DQIkIrpR92eW9vEXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NSBTYWx0ZWRfX7O8vUzQxpEYi
 W55HZfaYjTH7/KKOABDtoKoKHj7OWBNBWeRStLaapPmzImKRTJd7EH+iGz6yP6UDO3xe9pcsMS3
 0Wg2+qCcpK6D1YZkItBnYvYq6DEUiy0=
X-Proofpoint-GUID: OM7815hQzSXhGnuONe_Olgmdxo-Qzcfh
X-Proofpoint-ORIG-GUID: OM7815hQzSXhGnuONe_Olgmdxo-Qzcfh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170085

Hi Konrad,

On Thu, Jul 16, 2026 at 05:16:56PM +0200, Konrad Dybcio wrote:
> On 7/7/26 12:12 PM, Ananthu C V wrote:
> > The currently listed SoCCP and SoCCP DTB reserved memory regions
> > don't align with the memory requested by the SoCCP Firmware. Fix
> > this by updating the SoCCP/SoCCP DTB memory regions to reflect the
> > memory region requirements of the SoCCP firmware, as described in
> > the Glymur v21 memory map release.
> > 
> > Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > index 20b49af7298e..9ec7c256b80a 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > @@ -602,13 +602,13 @@ spss_region_mem: spss@88a00000 {
> >  			no-map;
> >  		};
> >  
> > -		soccpdtb_mem: soccpdtb@892e0000 {
> > -			reg = <0x0 0x892e0000 0x0 0x20000>;
> > +		soccp_mem: soccp@88e00000 {
> > +			reg = <0x0 0x88e00000 0x0 0x400000>;
> >  			no-map;
> >  		};
> >  
> > -		soccp_mem: soccp@89300000 {
> > -			reg = <0x0 0x89300000 0x0 0x400000>;
> > +		soccpdtb_mem: soccpdtb@89200000 {
> > +			reg = <0x0 0x89200000 0x0 0x20000>;
> >  			no-map;
> >  		};
> 
> The updated regions point to "SOCCP Boot [DTB]", whereas the old
> regions point to "SOCCP [DTB]". I'm assuming HLOS potentially loading
> FW to the boot regions is fine?

The reason why there are two seperate memory regions for SoCCP is because of
some Hyper-V limitations not allowing HLOS to reuse the memory regions from
pre-HLOS context for SoCCP. This is a windows specific issue. KVM is not
limited by this, so we are able to reuse the same memory regions loaded by
the bootloader in HLOS context as well, and do not require two seperate
memory regions.

> Konrad

Best,
Ananthu
