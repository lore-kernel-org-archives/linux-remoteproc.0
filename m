Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC04E2FFDF3
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Sep 2025 10:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758537219; cv=none; b=YnfE4n+pTg0GKn7K5ejUndWc7mqJT37wQiJhy+/ORxcpEUppTSCQplsNPBBAKv5oCa04UFdvm3FEgZbmujYSX4sQbU7zp6gwDuhKuHShKkDuE+zwsYUuRWUAuULbmyi4aO/zubthjLRBWPkXj75k1n2OHkTfxThZWWcrb0D7v7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758537219; c=relaxed/simple;
	bh=StOqZObgJ1vM4HpcUU0gQz23RbwVWYAw6VNTT2jCBsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksUHgQM8ME1/IGQ7a75rAKh9niWkbFQdtZgCQo8gElA7PeNv+UUnEntFbjGv/eQZK3yM5wBpTeuW0vBmO7Cs8hv7hsajUBZkWE0Ah3opVvxVh0v1pva3BPaxCO9UA2yFlxzy+U+u/97B7g6lyXekuxgRLzc4COS/mzzzpI5KYxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KX2CjQ92; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KX2CjQ92"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M95UDC004892
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Sep 2025 10:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6vohyW6P/xPQXkhXTVUfhSzg8HjrVtZUzEp0pInDVYA=; b=KX2CjQ92y1QB0g4O
	rLrVpqbT/7ySxN2LlyfK5dVOBHX+hPmsSTQ9sf96uX1fYoAkJkhJPbBZjQmb30PV
	7iL5s9SQ4HEtssjmNl+GByORbFZuniK3c4DTISxRxyLcfSsnFl2dPtCbLadr22hc
	jZDOGGBVlgUcO0ZReBdwByADAu1QH1+3T3GreIUqlZgUj4/315rAwKJIZ7lyHbml
	stWTN64k6Ay5QpcSPfQPI2TUCByVSm94htltesG4DXhKcThENo9aQK1NGuY6jfA9
	yc8YP881loqz79dHFjqnq/ZR4R7k+8fL6vfpgj7RESV8teWY6GLtPqNXqD1ZAPTg
	uwW52w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnmpcw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Sep 2025 10:33:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2698b5fbe5bso53036215ad.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Sep 2025 03:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758537215; x=1759142015;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6vohyW6P/xPQXkhXTVUfhSzg8HjrVtZUzEp0pInDVYA=;
        b=U0PqsRblb7z32DAbAzQijiQN1+REM5WK6WhHmY6m2vvRi/lNVMeSe+iYJZwUCgbcLX
         h8bud1c7EA4mjrqvbhh/GCyU6avZnjDnr++SXl9/UTgMPcVRtrt04fW7d0MpwUtARp/o
         NSIT9mVnO0lxLPWgrPIqEQpSpBd95LfnuUKOXz6rJisJQ+RzLlFKsfR3drVQgz4v/tEk
         SQdLvsvheckbeTUvZBpNVyaIsVVyw0c7vl+CgZNsYNI4GJMzMTdid+oIMYAHDovSVP8s
         P9M20ImvkIpTIvfn0wnzzxFmjAbGDw9xVcpjJ+LY6026fTyZE00scyqvlDMaImwEfoup
         /DLg==
X-Forwarded-Encrypted: i=1; AJvYcCW+wyyQRN5Bod9T9qi5wSZiVNQYrOd9rXY5ubsPafZ8MMeFNYjqUzjouaJcFzoya3TcESJpiHb+WE7UeiwecFKc@vger.kernel.org
X-Gm-Message-State: AOJu0YxF0j7lXKmc7NR/5yfy0ZHGjxbc78S0dsXc9v0mWQbJorAASSiK
	MT89JxaWLTtJlx6TzOqPd6sCccujqd0iRTjhXKrqV5tzpyDqRPgbwzbN3MYyk0ObYED+hR0kybQ
	WqazFcJ3PNBk1Ph5q+p5Ri6+5DEJuXpdrejxSEPpH0n3vgHjYFwzLXalYoUxVQHjivNFrCoVR
X-Gm-Gg: ASbGncubz1TtJqLrCmsMu2KA6va7HC/jXtf/MRu5BrOfy4O/hhElsIcSRi36uxH24bI
	rHDoN/KzgVDqqeRDyJOuoXPa8/THCBTzd1Y4GiG6XBWFyrB3AcVxJJoFJG+W3ChvLwtM4YaPKxN
	eWe98DuIuRvOkn66WKu0poir/L4QzEixrKH9wq9y4CXa0WUm98VYIE231zHxnRvM3+JUXf9FW1u
	/en5TwDS9nHOxbvCo1hlI7k9LYcS2vbMXk0DqwTPqiuHH9BPqMKRWW6nLrpSAgjrnqBwZUkiF9w
	8smsftQhHZ4OUHqFgEzWOXKzxuyxrjB3/WW78II54WMhD6aWi0GgNxOIpEoCRYwjbcY=
X-Received: by 2002:a17:903:24e:b0:24c:7bc6:7ac7 with SMTP id d9443c01a7336-269ba46450cmr195196945ad.18.1758537215031;
        Mon, 22 Sep 2025 03:33:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxlj2E1ZL+mzjQ9VZNOizJlfhTeeWSHY7qa+ersqewi96K8KrixBgeNCQrDKVnMq1/YWzgiA==
X-Received: by 2002:a17:903:24e:b0:24c:7bc6:7ac7 with SMTP id d9443c01a7336-269ba46450cmr195196395ad.18.1758537214528;
        Mon, 22 Sep 2025 03:33:34 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980339e89sm125802635ad.130.2025.09.22.03.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 03:33:34 -0700 (PDT)
Date: Mon, 22 Sep 2025 16:03:27 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 00/12] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
Message-ID: <20250922103327.ylyqwo5hpmtsbx6q@hu-mojha-hyd.qualcomm.com>
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
 <aNEEglLZTJuR1sLi@linaro.org>
 <20250922094732.6tupym6ulroctm5m@hu-mojha-hyd.qualcomm.com>
 <aNEcngb2T62HYlMq@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aNEcngb2T62HYlMq@linaro.org>
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d12600 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=cyWJFerwHc5G6ORteNIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: aCxABpxUjKLe6-Yan1uQcwzfXoN2P7ba
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX7wfQ5bi4dV0V
 uwgiQQOvoOhecuzRhbvvsLP7ymDeG3Oa81CkitGKM9jnCeTVkc/KLK642p6Bqv2o4YSPiOEMahR
 2jccSogEOpVJOQt57GEYWvPQ/Wn0INp9RpjrE3WrwmITb6o9HVnpxJ2oL8ceVGwULG4ogokrItW
 DQ3Rbq4GwGBn+S2y/ixtxZaoTiYE7FjFkOoY285I89hXA2QNoDsirGe1rcAZ3bIDb9aKfjYbAJa
 f45RxHUnn0nLOkM8+BAPuIGZHZviY15blbDXg0R4bC2NG9bxT8xr6Ty2sONa0KiGzqSJlO5EJtg
 2GpjuaO+0pe/+sI+5D9PaWLax4X5KEJ5E1b2PCutt/s6oEC5brRTxFBC6e+pCwoYkdJWKGJBe7M
 k7QX+/Jk
X-Proofpoint-GUID: aCxABpxUjKLe6-Yan1uQcwzfXoN2P7ba
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

On Mon, Sep 22, 2025 at 11:53:34AM +0200, Stephan Gerhold wrote:
> On Mon, Sep 22, 2025 at 03:17:32PM +0530, Mukesh Ojha wrote:
> > On Mon, Sep 22, 2025 at 10:10:42AM +0200, Stephan Gerhold wrote:
> > > On Sun, Sep 21, 2025 at 01:10:58AM +0530, Mukesh Ojha wrote:
> > > > A few months ago, we discussed the challenges at Linaro Connect 2025 [1] 
> > > > related to Secure PAS remoteproc enablement when Linux is running at EL2.
> > > > 
> > > > [1] https://resources.linaro.org/en/resource/sF8jXifdb9V1mUefdbfafa
> > > > 
> > > > Below, is the summary of the discussion.
> > > > 
> > > > Qualcomm is working to enable remote processors on the SA8775p SoC with
> > > > a Linux host running at EL2. In doing so, it has encountered several
> > > > challenges related to how the remoteproc framework is handled when Linux
> > > > runs at EL1.
> > > > 
> > > > One of the main challenges arises from differences in how IOMMU
> > > > translation is currently managed on SoCs running the Qualcomm EL2
> > > > hypervisor (QHEE), where IOMMU translation for any device is entirely
> > > > owned by the hypervisor. Additionally, the firmware for remote
> > > > processors does not contain a resource table, which would typically
> > > > include the necessary IOMMU configuration settings.
> > > > 
> > > > Qualcomm SoCs running with QHEE (EL2) have been utilizing the Peripheral
> > > > Authentication Service (PAS) from TrustZone (TZ) firmware to securely
> > > > authenticate and reset remote processors via a single SMC call,
> > > > _auth_and_reset_. This call is first trapped by QHEE, which then invokes
> > > > TZ for authentication. Once authentication is complete, the call returns
> > > > to QHEE, which sets up the IOMMU translation scheme for the remote
> > > > processors and subsequently brings them out of reset. The design of the
> > > > Qualcomm EL2 hypervisor dictates that the Linux host OS running at EL1
> > > > is not permitted to configure IOMMU translation for remote processors,
> > > > and only a single-stage translation is configured.
> > > > 
> > > > To make the remote processor bring-up (PAS) sequence
> > > > hypervisor-independent, the auth_and_reset SMC call is now handled
> > > > entirely by TZ. However, the issue of IOMMU configuration remains
> > > > unresolved, for example a scenario, when KVM host at EL2 has no
> > > > knowledge of the remote processors’ IOMMU settings.  This is being
> > > > addressed by overlaying the IOMMU properties when the SoC runs a Linux
> > > > host at EL2. SMC call is being provided from the TrustZone firmware to
> > > > retrieve the resource table for a given subsystem.
> > > > 
> > > > There are also remote processors such as those for video, camera, and
> > > > graphics that do not use the remoteproc framework to manage their
> > > > lifecycle. Instead, they rely on the Qualcomm PAS service to
> > > > authenticate their firmware. These processors also need to be brought
> > > > out of reset when Linux is running at EL2. The client drivers for these
> > > > processors use the MDT loader function to load and authenticate
> > > > firmware. Similar to the Qualcomm remoteproc PAS driver, they also need
> > > > to retrieve the resource table, create a shared memory bridge
> > > > (shmbridge), and map the resources before bringing the processors out of
> > > > reset.
> > > > 
> > > > This series has dependency on below series for creating SHMbridge over
> > > > carveout memory. It seems to be merged on linux-next and pushed for 6.18.
> > > > 
> > > > https://lore.kernel.org/lkml/20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com/
> > > > 
> > > > It is based on next-20250919 where above series is already merged
> > > > and tested on SA8775p which is now called Lemans IOT platform and
> > > > does not addresses DMA problem discussed at [1] which is future
> > > > scope of the series.
> > > > 
> > > 
> > > When testing your series on Lemans, what happens with the additional
> > > SIDs from the peripherals assigned to the remoteproc ("DMA masters" in
> > > your talk)? Are these running in bypass because the previous firmware
> > > component (Gunyah?) had allocated SMMU SMRs for these?
> > 
> > There is no DMA usecase present for Lemans but can exist for other SoC.
> > 
> > > 
> > > It would be worth mentioning this in the cover letter (and perhaps as
> > > part of the EL2 overlay patch as well), since it is unclear otherwise
> > > why your series does not result in crashes the first time a remoteproc
> > > tries to use one of these DMA-capable peripherals.
> > 
> > As I said above, It is not present for Lemans;
> > 
> 
> Ok, thanks for clarifying. In other words: The IOMMU SIDs you have
> specified in the overlay so far are sufficient for the current firmware
> use cases to run successfully on Lemans?

Yes.

> 
> > To handle the DMA use case in generic way, we might require extention
> > change in remoteproc or generic iommu framework to handles these
> > scenario like its SID and memory resources should be communicated
> > through firmware resource table or device tree or some way.
> > 
> > And same scenario when resource table section not present in firmware
> > binary ? like most of the Qualcomm platforms, how these cases would be
> > handled and I believe this is similar to the problem video is facing for
> > non-pixel case.
> 
> It is sort of similar, except in this case Linux doesn't really do
> anything itself with the mappings. In the video case, Linux dynamically
> maps buffers (or similar) into those address spaces, while in the
> remoteproc case those are fixed(?) for a specific firmware binary. At
> least if I understood the explanations in your talk correctly.

Memory region used by DMA use case would be fixed with subsystem
carveout memory but need to be mapped with DMA SID before subsystem
boots up so that it could use the DMA. So, it looks to be subdevice
for remote processor but programming of DMA taken care by
remote processor firmware and those detail would not be mentioned in
Application processor device tree.

> 
> Anyway, if you don't have these use cases for Lemans this can be
> discussed later in the context of a specific example. I thought you have
> this requirement for all platforms.
 
Sure.

> Thanks,
> Stephan

-- 
-Mukesh Ojha
