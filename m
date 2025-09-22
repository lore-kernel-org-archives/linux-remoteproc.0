Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2527911185
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Sep 2025 09:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758534462; cv=none; b=HHxHRBrIaDDBuwa4g/PyHDJnp0nxcDU5nUp6CpldmtafRqlkQ50ACbt8ojougShvAIs/U8OojmDWffb5t1sgmLbbVgCYOljB2ZqGm3WfsK3HA9/nz6GUhLKhRPNz3hpoxky9YeKMmRaQqQvi+k/XrI1kolvKXGwy7PCgDDSr/tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758534462; c=relaxed/simple;
	bh=wG6gy3zNgvK0SaWE24PcPXvv+61goeCB0+d3wpASfbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dCd8ka8da4RgJJxXKLqZDGKzpVk5BLIx9fWeKDGHf7O+lEWMAw6NmOREdHBkJa6aK9vU5WFXduSkRqIzz8N2eZqlS0ei52m9hUp/NUFiRnAfnHbvX1vswVYMMcQJvP1C8Tv8MZpwJRRvQ/ZDALqhRNa8cPscZXHkvXUKfR4HU+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqGPHDhZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqGPHDhZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M7pId8006029
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Sep 2025 09:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WGdIQ4qYSZ737eRdRm9nKoCxRG7BUPmxKIjfPulkgT4=; b=AqGPHDhZwbHQL6bE
	xg8+lisXExZ1xC7+D6/R1zPn4OYpNQ5FMGhj38/5QXbouCdSrk864aZVhNU8JyCD
	2vP0VltCGjGjoTsQnck7+E8RzYOUCtZQol30Xa+xoBny8m+cfrw447dy0HHVqOey
	T9DpDJ5PB5n2NLRfaHm6jXYJJEvrJHi1AgN3jEZARmTt0GNUjxE/rQWiLT9hScJy
	1vLmGTxclF2wCh79MmgDCRJMIQtUoCDWo+mZmidiqQK+l6Ydf2mmMcrjxWZLZ887
	jF58R6SQYfuohBHWOG4WWeHX1+uGESgGNM9aJ0z0xgo6HHOC2+FCcWl4FuaiW+LN
	LL/VIg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b2e10e3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Sep 2025 09:47:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b552f91033cso2896646a12.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Sep 2025 02:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758534459; x=1759139259;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WGdIQ4qYSZ737eRdRm9nKoCxRG7BUPmxKIjfPulkgT4=;
        b=o8BGXndt4oPIDzQ0bGxeb/Obf4V8E5M3eo4HI6q30dZT9cQeBUbx6RJvRJ8A4MriYA
         C8BuZsjQaf0UAxndBPq88YkcwhUr0Lkc+fq3kRtSF/uCA3/JrWc5sEboPy7tnVn9yWbM
         GFnr3TM/H1kD5uxkbBnnQvD/PCYrQ4df/gRLQwZpfpa9z+ULyc6yEa8xnUpBlsfy4zkx
         WhwicA963rvGbCobN8fBZHgkccMTZwIN9iLT5IpJG6WIzdWHWmwYB2svOjOYVqjElULd
         irS9EprQ7hPJjabnjtwChvV4ThzWWAYPoeKYmJJfAJuUjPpeALcohNoG0WQZiKxB25OJ
         CTwA==
X-Forwarded-Encrypted: i=1; AJvYcCWXRRFuXnkiw8WCVAJIjUkTe7Lw8MHIeC3QoeffvgKh2koBQuKyetzrzjDHcYyz7x362WMHUqd4di9tb7LcUmug@vger.kernel.org
X-Gm-Message-State: AOJu0YwkDmEejZO6TM0jii21WUuOHH1UrKlhZoI6hIOSgmzpkMawpwK5
	p+bHmnXp0DexlcGOnR2EA0nbemGDAuSuH4OBZ347bNKaQF1OTfJFZ+Uyw+AvdkYfGsRjm2sy/bT
	GfcW1MfrWUr9eV7NwOdzkUL41n701oIHE0wgH3qWFUdx7vWwyf0VOxWYZJ9j/9exEK+bopXyJ
X-Gm-Gg: ASbGncswHE1zqL/hx0N1nCguoigfF5CSoryYq9D85R3b2I2LipKaRyjvLrhwg4grhUZ
	YTH/XLXKYy/EnP7P9Eb4qUxkwJGNvyEz0U5MpL7AzMil3EqUNjrx2LSEKklUo4ENy4o9JSvcG9P
	SP0S9MVqDzXy7Wc8jGbn4ikxMD9DkGUlSrI9ar3lirYsQ6/wRfTp0ocCKYkiwqMzKnUqdvZv8Hx
	GfwfYmI5XXG4xcjhkM9iks820EqaxCa3HR5Zqgyn7Ki3jyDQeudlPpBtIbg/PuJ5+9mmxy7DPf7
	cR4fkGv44mCCLI3XRtBYFIYe3tE289kHbx9yBnirJyNXhRKBKu+QMRZlyBM+8tQUDCM=
X-Received: by 2002:a05:6a21:99a4:b0:2b7:949d:63e1 with SMTP id adf61e73a8af0-2b7949d67f0mr4427335637.32.1758534459411;
        Mon, 22 Sep 2025 02:47:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxxyJjG8MKO7qTspnofhXTloIV/UC1xZ6pSD0cCtZLN5fyOt/xTpZZxUrTP1r/Y6HwQvh4Aw==
X-Received: by 2002:a05:6a21:99a4:b0:2b7:949d:63e1 with SMTP id adf61e73a8af0-2b7949d67f0mr4427297637.32.1758534458934;
        Mon, 22 Sep 2025 02:47:38 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2d435616sm3828525b3a.5.2025.09.22.02.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 02:47:38 -0700 (PDT)
Date: Mon, 22 Sep 2025 15:17:32 +0530
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
Message-ID: <20250922094732.6tupym6ulroctm5m@hu-mojha-hyd.qualcomm.com>
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
 <aNEEglLZTJuR1sLi@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aNEEglLZTJuR1sLi@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA3NiBTYWx0ZWRfX3svK75/n+RpZ
 9Rsgohp2/fsLPjqNJAuT5sf0cp9qla4UrXxeDMKP5emSeye0RuwWo5quc3ltqNsONsODaLsJWvj
 i/EvfVh34C6XXXTrZG9RSoA4sGbqMrn21Vz+3KUUe490xzZ9wHJPA3Bls4iCWpSf1HOHCVTwvZX
 ODrDC06I38pWS4MW74D8g39gJ8FwEavp+sVfI0UfP+j+qSQdYUb8h6WQnpnZIewcfI17XxWUJvy
 7UJitaBVSvX4ncr31xiN5uniUQLhhaq25ttDYsFJCoVnh6dHVrNPe+aw3Oz0OxKwUSflWZPinan
 srg/kqowuvTFmBMbYI7Yi8SINiXWchnAl2VImgW5xGybaVEu1I1/9omwGXwuqlN+WznQM93fC3/
 pNl2YQat
X-Proofpoint-ORIG-GUID: k6Uu3Y7BkcnTMKiUBh4-PEQUQNjguuqw
X-Authority-Analysis: v=2.4 cv=HM7DFptv c=1 sm=1 tr=0 ts=68d11b3c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=HW3qntPLjzzc62cy6IQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: k6Uu3Y7BkcnTMKiUBh4-PEQUQNjguuqw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220076

On Mon, Sep 22, 2025 at 10:10:42AM +0200, Stephan Gerhold wrote:
> On Sun, Sep 21, 2025 at 01:10:58AM +0530, Mukesh Ojha wrote:
> > A few months ago, we discussed the challenges at Linaro Connect 2025 [1] 
> > related to Secure PAS remoteproc enablement when Linux is running at EL2.
> > 
> > [1] https://resources.linaro.org/en/resource/sF8jXifdb9V1mUefdbfafa
> > 
> > Below, is the summary of the discussion.
> > 
> > Qualcomm is working to enable remote processors on the SA8775p SoC with
> > a Linux host running at EL2. In doing so, it has encountered several
> > challenges related to how the remoteproc framework is handled when Linux
> > runs at EL1.
> > 
> > One of the main challenges arises from differences in how IOMMU
> > translation is currently managed on SoCs running the Qualcomm EL2
> > hypervisor (QHEE), where IOMMU translation for any device is entirely
> > owned by the hypervisor. Additionally, the firmware for remote
> > processors does not contain a resource table, which would typically
> > include the necessary IOMMU configuration settings.
> > 
> > Qualcomm SoCs running with QHEE (EL2) have been utilizing the Peripheral
> > Authentication Service (PAS) from TrustZone (TZ) firmware to securely
> > authenticate and reset remote processors via a single SMC call,
> > _auth_and_reset_. This call is first trapped by QHEE, which then invokes
> > TZ for authentication. Once authentication is complete, the call returns
> > to QHEE, which sets up the IOMMU translation scheme for the remote
> > processors and subsequently brings them out of reset. The design of the
> > Qualcomm EL2 hypervisor dictates that the Linux host OS running at EL1
> > is not permitted to configure IOMMU translation for remote processors,
> > and only a single-stage translation is configured.
> > 
> > To make the remote processor bring-up (PAS) sequence
> > hypervisor-independent, the auth_and_reset SMC call is now handled
> > entirely by TZ. However, the issue of IOMMU configuration remains
> > unresolved, for example a scenario, when KVM host at EL2 has no
> > knowledge of the remote processors’ IOMMU settings.  This is being
> > addressed by overlaying the IOMMU properties when the SoC runs a Linux
> > host at EL2. SMC call is being provided from the TrustZone firmware to
> > retrieve the resource table for a given subsystem.
> > 
> > There are also remote processors such as those for video, camera, and
> > graphics that do not use the remoteproc framework to manage their
> > lifecycle. Instead, they rely on the Qualcomm PAS service to
> > authenticate their firmware. These processors also need to be brought
> > out of reset when Linux is running at EL2. The client drivers for these
> > processors use the MDT loader function to load and authenticate
> > firmware. Similar to the Qualcomm remoteproc PAS driver, they also need
> > to retrieve the resource table, create a shared memory bridge
> > (shmbridge), and map the resources before bringing the processors out of
> > reset.
> > 
> > This series has dependency on below series for creating SHMbridge over
> > carveout memory. It seems to be merged on linux-next and pushed for 6.18.
> > 
> > https://lore.kernel.org/lkml/20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com/
> > 
> > It is based on next-20250919 where above series is already merged
> > and tested on SA8775p which is now called Lemans IOT platform and
> > does not addresses DMA problem discussed at [1] which is future
> > scope of the series.
> > 
> 
> When testing your series on Lemans, what happens with the additional
> SIDs from the peripherals assigned to the remoteproc ("DMA masters" in
> your talk)? Are these running in bypass because the previous firmware
> component (Gunyah?) had allocated SMMU SMRs for these?

There is no DMA usecase present for Lemans but can exist for other SoC.

> 
> It would be worth mentioning this in the cover letter (and perhaps as
> part of the EL2 overlay patch as well), since it is unclear otherwise
> why your series does not result in crashes the first time a remoteproc
> tries to use one of these DMA-capable peripherals.

As I said above, It is not present for Lemans;

To handle the DMA use case in generic way, we might require extention
change in remoteproc or generic iommu framework to handles these
scenario like its SID and memory resources should be communicated
through firmware resource table or device tree or some way.

And same scenario when resource table section not present in firmware
binary ? like most of the Qualcomm platforms, how these cases would be
handled and I believe this is similar to the problem video is facing for
non-pixel case.


> 
> Thanks,
> Stephan

-- 
-Mukesh Ojha
