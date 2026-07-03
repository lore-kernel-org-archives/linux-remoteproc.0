Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFE43EDE7A
	for <linux-remoteproc@vger.kernel.org>; Fri,  3 Jul 2026 14:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783089348; cv=none; b=mrcKwm6k8jvCJvs+Az9/qv0bymxb8dtUiZCNS+qfI1Ev3URA+CiXzlRpMXcHgYa/ExESta9lLHP2VUx2frFve4y5cFIX1vMr64yJyX3FsnUL2QzSGHZbLzqH7oBxCffOkncGYh52tUV2mmPMGkIlsm4O7EFmAN1AI7UvQTbPh7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783089348; c=relaxed/simple;
	bh=HgFi9QVMBwNzib44gHGEtsz5RXKusZm6n4tj8Jo1pF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HyYsUoves7ekwwGSo5clClo71ugMNh60x+hlXrJ4okwGy2bINUixZUTvYIsWsg+Xs/f9xq8RIc7Wa6lppSXf53hxdSWcRywwe8IQgX22iVHBWk+XhS477brvFP+4Xnz6CZ9sKCQnScT56W9Pboisb1jz2LroNCyB7JHB2rgGG34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M5zofz3x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CGHE48j4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M5zofz3x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CGHE48j4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663BW16V3136108
	for <linux-remoteproc@vger.kernel.org>; Fri, 3 Jul 2026 14:35:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v1jUYSiye1pLm+j6sCHsWCk7URSeaocyAVQOnxDwAvI=; b=M5zofz3xrGNcWxBP
	HdM62Fz6CLFR1DadPx0ESYz9jVOxckX/zrIbmfNeBk+F+C9UfG6bcy7vn6iqPaIu
	+iwnr4f31WKnJNTWcAaTa5mAP3EdDr2BCqCMLU2xwN0x7hPAKjvaL8+tImHHCKHG
	XP1u7CLv1HsTIxNI3TheA/R50Knz6CxhunWSWD3CaJl127GpcLLHUYFhzTrUv/w8
	MDDce2+WlMeFR6pIVvOENAZgRC321VGzv8aDlPCz6dO2ejUXswuRmPulMJ8q4vVr
	u3qUB+9Ssg9Y2+rWdlrHnro384w91+XJ8/Wg0Gqq+wH77I4K0eVmLjcq8GPhiEgq
	+BaxIA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5ar57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 14:35:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ca0d4fb061so11671915ad.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 07:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783089344; x=1783694144; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v1jUYSiye1pLm+j6sCHsWCk7URSeaocyAVQOnxDwAvI=;
        b=CGHE48j4jwuwE8b4vFmDpmUtol0JGVGlrE83U5ZcuyBUmiQg859f5i0ExPRl3lj1Io
         RuSoTw3yoUhrrDHMTFiEJO5Tv5XqPo8uMkTX2Tu74v7RZL+JzDd1fyCOfX/lgFIh69v+
         F4wyRY1q5L+8NS2b8CZ4bEQT56mv2TgBQyR6c1/GE300c1cqoDVuojKr9giHs8kxbUsE
         7ztqusM0/m98sCuFzGWhyrd4CtI7rrxkJ7QWtaCFadZptS/HcUFHQkod5u7ZqLP/ltv3
         a6hYrs5s/BwZyDOcgOYtZYG6ONGW3EF+BuD0F6gVu34dX5V3/qhR979nBHAc7jCXLChL
         sG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783089344; x=1783694144;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v1jUYSiye1pLm+j6sCHsWCk7URSeaocyAVQOnxDwAvI=;
        b=pYKUcZGxufmrqwDAWFXg7ws1BUNlh59o+7cK6+GhgVO79GC480oM0NE1Pt76OfhwE1
         uPoqVSbZ6TAsgtTMHR0TaQIcfCDfnhpdJXtfcR4IB9CvBZtR9kBkRxCvQnntx2qsv3pz
         ORTFj85ZsQNdkZqirq65PIbEXVi5CMRIqOpFqbVyrrzzxzAVhUgF2prXWwsZi6iuWLiS
         4zDr+xw+jxRZMhKgiAVUVyLPxifIXn/WvjQf5wobolr69loQBSUd+9KS0h+88+RRJHmi
         J2FoXMQnh9mtQh5f+1gTd3te4Kec9UDc49LS0k4mfHVoSysIJlD7OP5jVjp/GzEEAp1z
         Y77Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro/j7/8ixNLUtzWMuK9NX61NY6XygC1FsmDkgTI0PY5MPk0BxR7VaSv7aqo2VPiOKpe8kxWpl0MntOimehzhZnE@vger.kernel.org
X-Gm-Message-State: AOJu0Yypt8TYJ34K7JUoUj6ajIWsA+V2zP1BigvqAmNRYET8Vr20/inP
	B7uYIXNIRS4MNcWw678wb0YOijIUyyEM2BHWqkZn9zWWhAnhb5O8fsYOBMoS8W2PbPtosIDKyWp
	p57hFMPorQ47pIfLutZUHIh2j12CRXOG6CTcQh4asUm3tqZjy4qfgBCjllW3JV4vzRkkmxoay
X-Gm-Gg: AfdE7ckD9Zr/DXCQpQu1TFdrCQiW0tF8Yw/g6V0QZvkg6crSfwGS528bvwlvPMtG+uv
	lR3+/SVHI5JYuxAbTAJHDWieIJeY6Q36V7MckGitvapja1MBQuYlRHlyHeGmYasTEfEtnqksVgL
	Ls+Q4AAeXxDwWZlDcpLg2x8bdn+GvRC8khDqnxR1/yAfis09rbmisyzwO1HuRf9KUoV5Bql4l+o
	vr5SRGHpaKd/h25pHWopWzy27uDnmIEY8ZvFBsrT/wE9aQQ9MoiF+9NwWKfchg1Rbqrwy/qmP27
	w38mwoABjfLh9O9nGdq9XnLH/gMAf1n7zEbIRrve1b8dlNAPC0Fsj8uPF27lOn6S5xi0jdJN+j8
	GCBTt2OjQ52lSiRO3IMRz4L41o42hwZDZ/m4n7Te6i8KsO+2IHcM0eZExZPF7
X-Received: by 2002:a17:902:e811:b0:2c9:fec5:ae82 with SMTP id d9443c01a7336-2ca7e8b3a8cmr120291905ad.44.1783089343713;
        Fri, 03 Jul 2026 07:35:43 -0700 (PDT)
X-Received: by 2002:a17:902:e811:b0:2c9:fec5:ae82 with SMTP id d9443c01a7336-2ca7e8b3a8cmr120291495ad.44.1783089343044;
        Fri, 03 Jul 2026 07:35:43 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c876ea9sm18701734c88.13.2026.07.03.07.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 07:35:42 -0700 (PDT)
Date: Fri, 3 Jul 2026 07:35:39 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 1/3] remoteproc: qcom: pas: add needs_tzmem flag to
 force shmbridge creation
Message-ID: <akfIu0V3XxQoV_Mw@hu-anancv-lv.qualcomm.com>
References: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
 <20260703-glymur-soccp-v4-1-b706c4c9b3e2@oss.qualcomm.com>
 <579360fe-9276-4d5b-9da3-e479ab8e5e37@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <579360fe-9276-4d5b-9da3-e479ab8e5e37@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE0NCBTYWx0ZWRfXwrAfAX/E/3xU
 YWdFlYDMKScFkCRJaACHs/U8enmt6EQQhL60RArwwzSTRSbF/K5YPxvZUWCW9MwHJxaYEpWm+aS
 YkluOEdcVFH6nZuBDZXIlb7beTsE8LY=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a47c8c0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ny-STUQjzk9O0FCgRqMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: eJoS_398vCr5suCqDHlokjFkoth19F4z
X-Proofpoint-GUID: eJoS_398vCr5suCqDHlokjFkoth19F4z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE0NCBTYWx0ZWRfX+KBbjca8yKaK
 6Rh+hTzW8bSPXVPj3KJhAoglBNo8/gGMX72ULOJ5kfWL76ZA9HFIHZhlCNHr7ZPDAAgCNU5t/59
 7ZNsVPwPPtyDxY+qYqwANaiqVtlx4AwozEv1fy3sD+IoJtLQWwdJiBbpG+wEXEQgjCnnAHYK08H
 CLpgrLYFWaJMrAMXVNSq4EG5wdywzL6R21RWuwa/KrqFzXGJ+4AaKNhYX0Zr2d+h50niZ2ne6T5
 997rXY1aASKIC1biGgj3EkHIZJBUOpdSbVwaBc1wCdaZKFQTG57XC3FYydRELmd9v+JFq/VTAcF
 HLfBVPi9TTOu7oFpn2/ueabyoXkb84SK7IBruXyqzWLODjGAcGOh87c8vuonql4rT0af0CXQ497
 4LkuX+qfx9xYKd/uzKyAJ5a7UJWD6dt9ssuUnp7aJeh278zzgtLWCuvAGhKwqrRYecCLNyZsSBb
 /wQcDGQqcIlE0mLdwUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030144

Hi Krzysztof,

On Fri, Jul 03, 2026 at 02:44:41PM +0200, Krzysztof Kozlowski wrote:
> On 03/07/2026 14:31, Ananthu C V wrote:
> > Most Qualcomm platforms feature Gunyah hypervisor, which typically
> > handles Stage 2 IOMMU configuration. Additionally, SHM bridge setup
> > is required to enable memory protection for both remoteproc metadata
> > and its memory regions. When the aforementioned hypervisor is absent,
> > the operating system must perform these configurations instead. We've
> > been relying on the iommu property being present for this, but for
> > remoteprocs that are already running like SoCCP the mappings are already
> > in place, and any attempt to recreate them while active would lead to smmu
> > faults and a non-functional remoteproc. Fix this by adding a needs_tzmem
> > flag which ensures tzmem and SHM bridge setup is performed independent to
> > the iommu property being present.
> 
> Looks awfully like LLM written and considering obvious problem, this
> feels vibe coded.
> 
> According to current docs YOU SHOULD add vibe-coding tag to the commit
> when doing that.

Part of the commit message is based on 5c720260e840, and the rest is all written
and readjusted manually. Every single line of change in the code also is fully
handwritten - well, typed - by me. I don't know where the feeling came from, but
please be relieved to know that there has been no involvement of AI here.

> >  static const struct of_device_id qcom_pas_of_match[] = {
> >  	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
> > +	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
> 
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.

I ran checkpatch well over twenty times before posting the series, and I did
it a few more times after seeing your reply. I did not run into any problems,
and as such I cannot understand the problem here.

I could not paste this into an external pastebin from my work pc due to policy
reasons, so please forgive me for sharing this extended paste here:

$ git status
On branch next-20260702
nothing to commit, working tree clean
$ b4 shazam https://lore.kernel.org/all/20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com/
Looking up https://lore.kernel.org/all/20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com/
Grabbing thread from lore.kernel.org/all/20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 8 messages in the thread
Analyzing 0 code-review messages
Checking attestation on all messages, may take a moment...
---
  ✗ [PATCH v4 1/3] remoteproc: qcom: pas: add needs_tzmem flag to force shmbridge creation
  ✗ [PATCH v4 2/3] arm64: dts: qcom: fix SoCCP memory mappings for Glymur
  ✗ [PATCH v4 3/3] arm64: dts: qcom: add SoCCP DT node for Glymur
  ---
  ✗ No key: ed25519/ananthu.cv@oss.qualcomm.com
  ✓ Signed: DKIM/oss.qualcomm.com
---
Total patches: 3
---
Applying: remoteproc: qcom: pas: add needs_tzmem flag to force shmbridge creation
Applying: arm64: dts: qcom: fix SoCCP memory mappings for Glymur
Applying: arm64: dts: qcom: add SoCCP DT node for Glymur
$ git log -3 --oneline
3aec83c4ebd4 (HEAD -> next-20260702) arm64: dts: qcom: add SoCCP DT node for Glymur
abb3c9998fbf arm64: dts: qcom: fix SoCCP memory mappings for Glymur
7a2db13e713d remoteproc: qcom: pas: add needs_tzmem flag to force shmbridge creation
$ scripts/checkpatch.pl --strict -g HEAD~3..HEAD
-----------------------------------------------------------------------------------------------
Commit 7a2db13e713d ("remoteproc: qcom: pas: add needs_tzmem flag to force shmbridge creation")
-----------------------------------------------------------------------------------------------
total: 0 errors, 0 warnings, 0 checks, 44 lines checked

Commit 7a2db13e713d ("remoteproc: qcom: pas: add needs_tzmem flag to force shmbridge creation")
has no obvious style problems and is ready for submission.
------------------------------------------------------------------------------
Commit abb3c9998fbf ("arm64: dts: qcom: fix SoCCP memory mappings for Glymur")
------------------------------------------------------------------------------
total: 0 errors, 0 warnings, 0 checks, 17 lines checked

Commit abb3c9998fbf ("arm64: dts: qcom: fix SoCCP memory mappings for Glymur") has no obvious
style problems and is ready for submission.
----------------------------------------------------------------------
Commit 3aec83c4ebd4 ("arm64: dts: qcom: add SoCCP DT node for Glymur")
----------------------------------------------------------------------
total: 0 errors, 0 warnings, 0 checks, 63 lines checked

Commit 3aec83c4ebd4 ("arm64: dts: qcom: add SoCCP DT node for Glymur") has no obvious style
problems and is ready for submission.

> >  	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
> >  	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },
> >  	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
> > 
> 
> 
> Best regards,
> Krzysztof

Thank you for the review.

Best,
Ananthu
