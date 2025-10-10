Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFC5277037
	for <linux-remoteproc@vger.kernel.org>; Fri, 10 Oct 2025 10:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760090916; cv=none; b=iqPiGzdgXdEDhJbZAJ44qst5n3GL543ml98BZFosruebqO2eqT+E181VbrcDPPgwQJda9Sy0EvWCCIznQgwHqr7WrfuF1tyTfJ0bOEH0k+aIQ1xqamh8dfbVfI5rRFTJS3txiV64OM/akoHCTop2n/nx30VNBS3s0ok+1xrh33c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760090916; c=relaxed/simple;
	bh=YOnQtEu7JFWMhUYj3xy66VgJf7TBh9ulmd+/dQCONcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=shWvcR5be+nc7ng8TgDp2ISmKY0XBgLC3qb9CkXXoNPjgBduOgOgm0rw7dCTmCnc/rtofZgtzJ8ta/p8Yi9gdXdA1WWfDOj1XN1lwogkevIbn3X4TtsbptWIh6mLhzCrHj3jAFaWSo5W3WKV9I0BA38jgR+D5XBkWnqAwiVe6h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kGZCA6nr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kGZCA6nr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A6WhMm018532
	for <linux-remoteproc@vger.kernel.org>; Fri, 10 Oct 2025 10:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FPvDh1+4NyZCubXd1ngtnPbpp/8IVN3Nsyy2TEjNtns=; b=kGZCA6nrmJWuTDoy
	NUrRwFyWeoJ2caE0NBseoAF2mTnWDaXEDhgHLpEukSRYuLCiYlsf9bQl+YSHJO0Q
	ckUDAywT980Hk6mAiNoh12HuSzTV+5dioGf4A9v3YWXtlWzHddWOQPiR+NYKE5Ja
	6ziNzZb6zmPwB3LkSO7dY6O2aENUVDNL0xe5DpzVJYgtmDH6VB/SXjj0DVuEjDE2
	U1J/7GZ7y0ryU5HkmSi1Cih4HaRvRk/yfKDH3U9XAXGce115EaW4DgwJ6xfW5B5f
	V4r6ZaiGDrdQbPk1zWn9Ropj4CdWci4gx5S77Oe35CSQ1KueNOwgtJO5YsKEPP0i
	rwNK/g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4m5yqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 10 Oct 2025 10:08:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32ee4998c50so4027458a91.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 10 Oct 2025 03:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760090911; x=1760695711;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FPvDh1+4NyZCubXd1ngtnPbpp/8IVN3Nsyy2TEjNtns=;
        b=m1zWPDeIKJAleGMB/kqtoJF7CkmPP9JMATCso6J10AI79msMuElXj4IeIfmA6K65gq
         +g+SNaybwT7e4yXfvethFmI8c6NKxzYO+lHj3m0zpeT5F9RgM57ILPhT3e1bgFoZuu3p
         sqshkdIp7GVNytDYCX0aR6987aQgsx2yFua3yW1QjrzRLU2Wz5PzVuhOYZPEiOVUElVX
         9EkrlIcgdxAFB0Ty4y5qxt/ti7Nvp3FRu0SxcykVOw/0EVCdjdlFrOPiy4ggyKcqPcuG
         L6UZVnpaFhXTM9kAN8wQtpx0Nv8KkG5OE1EVU6viMl6YbkHVU4ZaL/tFAJMkvZIAsHEA
         HR0g==
X-Forwarded-Encrypted: i=1; AJvYcCVHg3vtdLYoA2onqJsbZQCHQpMYZ58Rb3x7o/2YBl8r6hBgIjrklr4XjFPoHJNJVRe6nC884+NeYnrmVafLCSUu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/aRjmg2PU6cFxMFwJW9iN5d190Y0natpxvibviHEt6U+j2TAM
	sX26yvmGh7ZbR527MDlSRgx1QqjRmClO1arJLRWYK9EwhnJl8AtDS021nbyDksi2kUBdEww1mpi
	NPDl39t+3AS6i8H7YUZrq/JJhhzZPy6V9RqTE01YQJOSIuNtgE/TO/g3DjkDerltf9F4nqEdoiB
	F9F53d
X-Gm-Gg: ASbGncs8wej1UxWYfnAvup5fEChkpcgua1kyivt4CrTHEod3e2GmZRwJwgSkeTxJrR5
	qi6lxY5xBltI6JjypJR6SX9/fblfD6KkF8HrOmQVS71/LMa0slbeU676Mag2OEhrmhs85dAI/v0
	sJkKPn4LD0E9TlTMY6EKalKRZOJW9QAeqHwG0OA6parhWWHs8GOdrhpwm+iLqkwvYeukjMLzkNR
	9p96yYSyRxAQodc14h+qNPp9lBcmBY6xmTxOQxeSyIuTHdYASgKv5QwqeQNfQK+MBbmoXDUVcqp
	Rhbg/KjRHcA44EMRU4iql7FYcGsbRX/SC0TIysIjbU5MX0Q/S5MZroUGjMwBtZnsfZ8=
X-Received: by 2002:a17:90b:4c07:b0:32e:a60d:93e2 with SMTP id 98e67ed59e1d1-33b51114ec4mr17421350a91.11.1760090911001;
        Fri, 10 Oct 2025 03:08:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6t323CK1XKUt3kCAeKmlXD3F1oo4fJpF0gTwFVa06YC+kIJzq3zfGNifAphNavHFinjSPDg==
X-Received: by 2002:a17:90b:4c07:b0:32e:a60d:93e2 with SMTP id 98e67ed59e1d1-33b51114ec4mr17421300a91.11.1760090910355;
        Fri, 10 Oct 2025 03:08:30 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626d284bsm2362830a91.18.2025.10.10.03.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 03:08:29 -0700 (PDT)
Date: Fri, 10 Oct 2025 15:38:23 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 00/12] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
Message-ID: <20251010100823.wc72fle2psf6r4wi@hu-mojha-hyd.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <b6akgk6nymtaxqak2procz4gkq6hrj2ao2yaw3axo6yjn7ekuk@g66xx5vd3fcp>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b6akgk6nymtaxqak2procz4gkq6hrj2ao2yaw3axo6yjn7ekuk@g66xx5vd3fcp>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX0xs51ffFdmaT
 9gpqy39vGozclopKAv8T2qcNBma3SvijYwNtwMfk1CYsKjW7z8Ry/2MBqWne8oQRGNkHhTLO0iX
 n/jmuHxRojNMNMJaSB78e488Iv4NNKXVqSVxIJykDLoNXYohWQd0yQ5BqUbg6nIfMdnKC3Fieir
 4oRlx5n0zerptAbnd0EpLEusiD7QOobbmAAbF3x0rdoN6bBY++6RwMNpcZZjN7oiQ6bVu0XAxJo
 g8+Gat9cYcymr6RsMegt7fXDcLM1Iwb2YdmBEnXRggaqZAI+XfRqcepoHZBAFansP/O43Jo/jYD
 1CGUkM4uMUs7wixcwLbmnZvPuUHGPhaWHykP0sPL8ervqF4I/0z3dKcpXKBD+DGPYEgfH412A4u
 ouDOD+xctMHAymGFWMsztRprjPlGXg==
X-Authority-Analysis: v=2.4 cv=B6G0EetM c=1 sm=1 tr=0 ts=68e8db21 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=4W5d78O8fA4mGIgYuL8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: nwB5CHe5lTAO8VZ3Ad5F39sQ_A9UfkfL
X-Proofpoint-ORIG-GUID: nwB5CHe5lTAO8VZ3Ad5F39sQ_A9UfkfL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Tue, Oct 07, 2025 at 02:56:13PM -0700, Manivannan Sadhasivam wrote:
> On Tue, Oct 07, 2025 at 10:18:45PM +0530, Mukesh Ojha wrote:
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
> > It is based on next-20251007 and tested on SA8775p which is now called
> >  Lemans IOT platform and does not addresses DMA problem discussed at
> > [1] which is future scope of the series.
> > 
> 
> Could you please add a link to the modified TZ firmware for Lemans, required to
> make use this patchset?

It is not yet available in public, but I could share you internally.

> 
> - Mani
> 
> > Changes in v4: https://lore.kernel.org/lkml/20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com/
> >  - Fixed kernel robot warning/errors.
> >  - Reworded some of the commit log, code comment as per suggestion from Bryan.
> >  - Added support of gpdsp0 and gpdsp1 and disabled iris node.
> >  - Add R-b tag to some of the reviewed patches.
> >  - Rename struct qcom_scm_pas_cxt to qcom_scm_pas_context.
> > 
> > Changes in v3: https://lore.kernel.org/lkml/20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com/
> >  - Dropped video subsystem enablement for now, could add it in future
> >    or on a separate series.
> >  - Addressed most of the suggestion from Stephen and Bryan like some
> >    remoteproc code checking resource table presence or right error
> >    code propagation above the layer.
> >  - Added leman-el2 overlay file.
> >  - Added missed iommus binding which was missed last series.
> >  - Separated qcom_mdt_pas_load() patch and its usage.
> >  - Patch numbering got changed compared to last version
> > 
> > Changes in v2: https://lore.kernel.org/lkml/20241004212359.2263502-1-quic_mojha@quicinc.com/
> >  - A lot has changed from the V1 and a fresh look would be preferred.
> >  - Removed approach where device tree contain devmem resources in
> >    remoteproc node.
> >  - SHMbridge need to created for both carveout and metadata memory
> >    shared to TZ in a new way.
> >  - Now, resource table would be given by SMC call which need to mapped
> >    along with carveout before triggering _auth_and_reset_.
> >  - IOMMU properties need to be added to firmware devices tree node when Linux
> >    control IOMMU.
> > 
> > ---
> > Mukesh Ojha (12):
> >       dt-bindings: remoteproc: qcom,pas: Add iommus property
> >       firmware: qcom_scm: Rename peripheral as pas_id
> >       firmware: qcom_scm: Introduce PAS context initialization and destroy helper
> >       soc: qcom: mdtloader: Add PAS context aware qcom_mdt_pas_load() function
> >       remoteproc: pas: Replace metadata context with PAS context structure
> >       firmware: qcom_scm: Add a prep version of auth_and_reset function
> >       firmware: qcom_scm: Simplify qcom_scm_pas_init_image()
> >       firmware: qcom_scm: Add SHM bridge handling for PAS when running without QHEE
> >       firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resource table
> >       remoteproc: pas: Extend parse_fw callback to fetch resources via SMC call
> >       remoteproc: qcom: pas: Enable Secure PAS support with IOMMU managed by Linux
> >       arm64: dts: qcom: Add EL2 overlay for Lemans
> > 
> >  .../bindings/remoteproc/qcom,pas-common.yaml       |   3 +
> >  arch/arm64/boot/dts/qcom/Makefile                  |   7 +-
> >  arch/arm64/boot/dts/qcom/lemans-el2.dtso           |  41 ++
> >  drivers/firmware/qcom/qcom_scm.c                   | 415 ++++++++++++++++++---
> >  drivers/firmware/qcom/qcom_scm.h                   |   1 +
> >  drivers/remoteproc/qcom_q6v5_pas.c                 | 187 ++++++++--
> >  drivers/soc/qcom/mdt_loader.c                      |  32 +-
> >  include/linux/firmware/qcom/qcom_scm.h             |  36 +-
> >  include/linux/soc/qcom/mdt_loader.h                |  16 +-
> >  9 files changed, 635 insertions(+), 103 deletions(-)
> > ---
> > base-commit: 68842969e138d9ad3e3aa2bbd65d514df1581b5c
> > change-id: 20251007-kvm_rprocv4_next-20251007-5e4ea5a978da
> > 
> > Best regards,
> > -- 
> > -Mukesh Ojha
> > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்

-- 
-Mukesh Ojha
