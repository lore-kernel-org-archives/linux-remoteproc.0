Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283461CD1E4
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Feb 2026 18:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771612569; cv=none; b=Ic+b4roG9dahFTnGSxC+eBQJNplWnpfQBbJXXtzOggjHlTd0QS7caF3D1xMv6s+dP7i0xQGMTZQbGdfgceo/DKn4oiPU+FRmxmCZjMjBJVyWBiNkN5LlIWZnDEVYbAlpY1IuMtEtQi0uGcLL0PEHF2C7oMnqDOJh5aCEpwc2tOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771612569; c=relaxed/simple;
	bh=6BBdkPJqMHHK3Zc0r4B5LyYxE6bwREEA7qGRi2JTxt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oSagMRqYCun/Rrz7tSEGZ2W3yf4rUQG+0TDNUUmQjIT8Z7crw7+DWAw2c0cvIzOiwHlG+lBtSl/MdmYLLtWLyGiPPJoX4N6Z73M/rwwYdoiny980Hpbui8XrThxwSSe+BefgH9l7jduVZ2Opm/dl+U+EQS6NnYymrbYIXGopqbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WR0v7JUD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ho6qkBf4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WR0v7JUD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ho6qkBf4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61KGu3W7574848
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Feb 2026 18:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j7/7cFtWPhvS1dcPn9E39BqC
	yO53/sfIBWAgvwItg/E=; b=WR0v7JUDPsyzVClcMgOPguuId1QLUl3+zclkstEY
	hn01GeWY/clspAFoIAYTH+LlDWcKJdyhGq53sZqQYZTpMKXDqR2gTGH3CyLRe7CL
	qef4SIbtSdBlOsr8DHR5myZUVDGOIb7GjoxoeyPe0+TzTqYYvVoZS8h+YRGNpMCR
	x9yPJhv9bDvZo/4BtL9bFDctdw8lPvs4Rp87vt0wzIIQji0WU/wlA3FkNSmyZmDI
	Q+6mjnjXOwRLonnUDxF4VvUqUIRWtdN7dtkhZHLcPWI8zN8zoc9rRS2tj06a8plk
	LQ7GXIMB9Po7n8bGIgLEWjdTSOhGH8kd3+k8QYC78PedZA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cedp6jgwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Feb 2026 18:36:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-896fbdb9968so237698786d6.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Feb 2026 10:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771612566; x=1772217366; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j7/7cFtWPhvS1dcPn9E39BqCyO53/sfIBWAgvwItg/E=;
        b=Ho6qkBf4t7QGTCOMyYJsRQZjcVhwRbQWPiXabgJS/kcKCRtyf0f/FlA2FwnwfRAG2C
         qqvu8uwk1KhRPf2ap6e5/Ny0aP6sTRyNNfjRRUkMGfh7g3SCKt9NGTD8q5JYvmhJLGRI
         jSV1UZUnyCld8keRiFo8Q70r44TT9fT+PoADqb17VIrU6UFk0HqrRDxsLpZ/RLbm52vw
         /bWrRsAQheDHv6phvcQsgklXZO3by5hM28vCcxsgw/6JPytc/4Mw+WJd2Xd98IF6mHsn
         ct3p6BvH81SvTZnACieaeATDvEN52KlRGb2LvT3AB7cYl75xcYeHt8K7+Q8T8CutCttN
         Zjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771612566; x=1772217366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7/7cFtWPhvS1dcPn9E39BqCyO53/sfIBWAgvwItg/E=;
        b=jRWyOXg7gE27G3cH/yUb9kNTlarXw8Axl5Qf16nl1YBi7Pf8Be+ajUnvoVIJa7Wvnl
         mo2rtwAFqCZdpjeAyymaSN3sujvi2AR2Q9k5ku3hlBsZMNPL1NyWWSzdIYI8vxyiuZnt
         GFThM1p+/xwN7bDLN/coaHKPV2paBX5cb6SzVw5adiCsVqxnPAsIr7NIDujNQIPQ1B8U
         V9i25+EhgNN/swO5Kta57lKwOjU7lqP5x2NttjoTdYOTumxGHvMDo3JwQTnw59hJhTz4
         bywDmGBG6tFHRVYu6UV+exvNo7OGmsLabQEQlVntYPnKVUfZuukZcIPqUVTQghOamaiQ
         jTaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfNHVwgagDSyPbQCTKhLUwgwZcj8qv3HNgrMfM8Ce1FBcvEk4rh+VpFVx6IddDrhxjTe11ZCGkkDVQMFi1XITr@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Wx/bA17GvanprFZc6cu8rN1pv2meNoUwSZALL9r5V4vQdsIK
	9X5wKBFnmyOLb4whIZvyWpOY5JbJUkN2NH6xcQxhqWWhOvTp5U0M+vP5Wws0J5FUAmOz1ga3/qi
	q2+Gbtt1bt9dexeAPUykXnavwRC9a5VQFZaDiNDPOQfxSJCNs3kExJQneMFJ4hIrZmlUpLjWp
X-Gm-Gg: AZuq6aKh3GoNx7DazcctnrIAB0Yx+PFTs0LmuZzrbSMrGla+BD+zZARZ2k4AOZnm5vN
	09J5LFVjViAcytAvwobk1stL4FNPvcxIrFS8gtpzaSvaZc/QxgQSS6PhDIYo/FQDQfypCfzXvpj
	+bm/JfReBwzl3tBP8R7d9X5FCeuiiuPajLDEHKaqgzEDqwF27adgdYlgMcJEy27yV+ZOnp1iyXN
	N/MvewESiGeoN3NHhtQFEiwlxRUfGKIk9FeuJJd9Bq0ol8QE9R/nAbsrV7r82lCjZ1tB+16npJV
	OnTp3Weavj9zHwB6J/WBXYPgYXuskLxTa3I4U6fMc9qvIHnKHzrTVbl5Sod3yXMTmUUtlE/a8XI
	oQmzHeq/Q025tEwVPeCsFHcVIKbVUsXMNtqFNp5m88UTXTR2sLgtsJE1bqmHBAYE2AfFlVo/ejz
	6pKhQKZypbGssibQb8O5nG8RGRt5TeNFiJ6xw=
X-Received: by 2002:a05:620a:4449:b0:8cb:4d64:e972 with SMTP id af79cd13be357-8cb8c9cdc56mr64927485a.9.1771612566282;
        Fri, 20 Feb 2026 10:36:06 -0800 (PST)
X-Received: by 2002:a05:620a:4449:b0:8cb:4d64:e972 with SMTP id af79cd13be357-8cb8c9cdc56mr64923685a.9.1771612565785;
        Fri, 20 Feb 2026 10:36:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7a96622sm145981fa.36.2026.02.20.10.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 10:36:04 -0800 (PST)
Date: Fri, 20 Feb 2026 20:36:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: George Moussalem <george.moussalem@outlook.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 4/6] arm64: dts: qcom: ipq5018: add nodes to bring up
 q6
Message-ID: <s4kuwcdyaqxe2e2mw5hdfxs3527glx6yswkgynju3owktn7uxf@nm5e5vqoihvv>
References: <20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260113092021.1887980-5-varadarajan.narayanan@oss.qualcomm.com>
 <62d53cdd-b71b-48f8-88d5-65407d3a80c7@oss.qualcomm.com>
 <be05578a-d90e-42ce-a1de-4f670fce03d0@oss.qualcomm.com>
 <DS7PR19MB88834BFC4ECEF7CA27C379139D68A@DS7PR19MB8883.namprd19.prod.outlook.com>
 <d610008e-bb1e-46d0-8397-126bc1e2542c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d610008e-bb1e-46d0-8397-126bc1e2542c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDE1NyBTYWx0ZWRfX8yegbE6hf5x4
 34DTgtCqxQYghCa3449HpuTY1r2C2NZZEwGq7Z5mAtIvkJgT+M1FY63sf13HLdcPLNgCxJEBVrT
 5VECMl7WOP83lSjZZVr/Gfk3sd6Jcaqa3Ze4R8KaNl+1v4tKcT03XHnOTnJOFUGwVC6j9uFjYij
 Ttl0wUxtrYc/m8i2XnRZvAhGu+3yWOpki/BEohl6wWPBaHkUtSB5HxV90eEOhpKJq56W0nb0zq0
 58+Xlv6ETOHDtZB6DUV/+SLrdkuc1BXfzh2mHf1Y0zQ1FA5/Uj2ULdZPbae5yDwi1YfCSK3ylJ/
 Az0npLgC9mkbhgjpSDS+pjHyPdnQm4cyQniVjv8wiogHOXDGDqYKEGotTonfJR5kFK+V5cYnXka
 EM0t1cFESDex7Ep63m7DQoizCg7H22rKtsuUJN8E60CNbvphpLD4iPe1qHq//0KpzEFJM4UGx6T
 nk/tzYRWhJoq2l/2uNw==
X-Proofpoint-ORIG-GUID: _70MHM_173ke3TfUoSiTa3YEZfQb0dkE
X-Authority-Analysis: v=2.4 cv=Vuouwu2n c=1 sm=1 tr=0 ts=6998a997 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=UqCG9HQmAAAA:8 a=hJAeSEcNMGQMv2vWbG8A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: _70MHM_173ke3TfUoSiTa3YEZfQb0dkE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_02,2026-02-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200157

On Fri, Feb 20, 2026 at 03:02:48PM +0100, Konrad Dybcio wrote:
> On 2/20/26 2:53 PM, George Moussalem wrote:
> > 
> > 
> > On 2/20/26 14:36, Konrad Dybcio wrote:
> >> On 2/19/26 8:42 PM, Jeff Johnson wrote:
> >>> On 1/13/2026 1:20 AM, Varadarajan Narayanan wrote:
> >>>> From: George Moussalem <george.moussalem@outlook.com>
> >>>>
> >>>> Enable nodes required for q6 remoteproc bring up.
> >>>
> >>> I just recently became aware of this series, and have some questions...
> >>>
> >>>> +		q6v5_wcss: remoteproc@cd00000 {
> >>>> +			compatible = "qcom,ipq5018-wcss-sec-pil";
> >>>> +			reg = <0x0cd00000 0x10000>;
> >>>> +			firmware-name = "ath11k/IPQ5018/hw1.0/q6_fw.mbn";
> >>>
> >>> This file does not currently exist in linux-firmware.
> >>> Instead there is q6_fw.mdt with associated .b* files.
> >>>
> >>> How do we transition from .mdt to .mbn given that distros update their version
> >>> of linux-firmware independently from kernel updates? Will we need to have both
> >>> the .mdt and .mbn files present for some period of time? Are there associated
> >>> changes which no longer attempt to load the .mdt files?
> >>
> >> Since there are no in-kernel users for this one (the ipq8074 WCSS driver
> >> requests that but no DT is wired up), I would say we should promptly move to
> >> MBN..
> >>
> >>> I ask because I've been told the ath11k/ath12k drivers will also need to
> >>> transition their firmware loading from m3_fw.mdt to m3_fw.mbn, and I'm not
> >>> sure how to make that transition.
> >>
> >> I can't see any m3_fw.mdt in the tree or l-f, unless the m3.bin qualifies
> > 
> > I think you checked for QCN9074 which uses amss.bin and m3.bin. For
> > IPQ5018, IPQ6018, and IPQ8074, m3_fw.mdt is there, see:
> > https://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git/tree/ath11k/IPQ5018/hw1.0
> > https://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git/tree/ath11k/IPQ6018/hw1.0
> > https://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git/tree/ath11k/IPQ8074/hw2.0
> 
> Snap, you're right.
> 
> I think a simple ln -s file.mbn file.mdt should work though? mdt_loader
> seems not to care about the file extension at a glance.

You are correct here. A symlink is a correct way to upgrade from .mdt to
.mbn.

Inside linux-firmware the easiest way to handle it is to add Link: to
the WHENCE file.


-- 
With best wishes
Dmitry
