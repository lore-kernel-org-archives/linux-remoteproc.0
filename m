Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E5F26C39E
	for <linux-remoteproc@vger.kernel.org>; Wed,  5 Nov 2025 08:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762330472; cv=none; b=VnzA8RNQcnyx8LiltDRFMvWeJf1R2RTjQ5QIUZMwmew47UXQi81cAk3fZ7we8Si/8s5kOaiXzBM3Hf4bJatn91jv1cB+TYDKxnQRJJAepClra6dv/MIlpkjqIHZg23TRjlqrYV+bKgA7UsSi0BmqRoUUK8+z0LAWud3xpyoGwu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762330472; c=relaxed/simple;
	bh=r6zyt4bW+tBVskOnaucS2r3ocRrPAZm2QMnoNvbsxlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qlV9Wx2IDxMNrFUGldR1pOUse25eTpTLy3GGVpxrPih+CYJx/3PZspo/sx3NjfyGcFA7hbL0lmcEpsV/Dwf3Z3A/fGbcO2zje2AnVrLEfLeMjNJtW5iY0YJY6nFgWXrAvy0aSaAlrVoWKEi4bODaVDJ8SJITHgChcmUcAJYrGp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=htT2GzeS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ALVlbSNF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="htT2GzeS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ALVlbSNF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A571Owk050977
	for <linux-remoteproc@vger.kernel.org>; Wed, 5 Nov 2025 08:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+8uq2dL0xROwRayc6kTJFxv2lTDmx7vFUxUiBAul+ao=; b=htT2GzeSWLczGcI5
	72ofoSdsm8wvzssYbPRJYLLiBwEksJYX6Iv3HZ+NzTy0hPjp6AJKNZS807h5G52K
	PNmdz6iCuU4UkpvXrvn4YBAmVv1kx1BTufZUbpE4eKd9l9BjNiagshtLYGJYlVic
	Y4fYDWy4bEsh0AmZVTJRlqjKz+WdzQbsAYWzoG1EyVVdCKIkhwszKWAz+ALqqM4G
	sIcJL65OTv/reM7uc5NOnrZwJPN79AoAS8OvBrJE+TynnwEtySKcEas/G70P8x2d
	fHdaa5Nc8codH6yBGZdvDAsncaV1Bsvvb1Hmlrep8aRp57A5KWOfJeoWM6mvkc1d
	QDikiA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a81u0g6k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 05 Nov 2025 08:14:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-340299cc2ecso1154072a91.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 05 Nov 2025 00:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762330469; x=1762935269; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+8uq2dL0xROwRayc6kTJFxv2lTDmx7vFUxUiBAul+ao=;
        b=ALVlbSNFwckHF0M0tulOyUXTDUrqIoqpKgtNHqPxU/fRoT3A83vF5i4Ni3KoO3wup5
         4CZEkfQ6U+XUvvLFbq1PcV3Om9S/9wN+0pqFgWdNPY75DoEkBLlhHbWvm3sEUxUE3dJ2
         N0MqXpkY7oWP4fRP5qdoQ0ZWVVFXM7jay3N4710ZmQ3B+Gg7sjnwycifE6rmbZpFBKlZ
         k0QR0c/VUqCClTb/4eqrixAwirbc2mzeSkAaXitaVw8C+TfT/YKlXy/gV7yRg9qc9Q30
         BiYBagJc38DUqQno2he5ab2TqQ5xJki8MJFkFevFjkd/byUwQusIQa+2eTs5GXfgpbkm
         dwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762330469; x=1762935269;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+8uq2dL0xROwRayc6kTJFxv2lTDmx7vFUxUiBAul+ao=;
        b=izsazTnT+ozez6ZqvU5Rw1+XX29GRbyQmf5Ujh+skdCnfxkYffL9yLp22NHxb1pmgD
         2mV8syxQ0CiIpl3EFYIHUE7vyvm2JwRZN2y3a0i9Tg3KvDM4CuUVsDB27jRL956+CTGf
         XZsym0rJRZh+XUDdJj544ADOe4ue3u7wB9by+ycQVgLYeReEpbW8Go23ffUvIYSB0lUU
         QAfR/uZeJpkjOXHUfv75o7Ly+CUOJK8R2mn/11DQ+EpHP9HzcveY5sAo2ruY2M2V2OPG
         Xl+TeZysj1aCLHOoe2qC3gnP/kXAVNHCRFzUMUUZKO005liaesRxt4fQZJj8tWz+BbS/
         iCaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWB4DOSVwk6lSXnZREnKEquShLJCZuasS0HH2rpmNf08+ngpeQchqrDPS1wXJgPVPIlrpL3Tw7ZU3vxl1VxNne8@vger.kernel.org
X-Gm-Message-State: AOJu0YzS85Shq5ColQEoHLQm4VG/VTnujbvzb175PL4vCoqblYRYCDCr
	7eg0TDXS+v5aWvUV6K7pjy+ccvIji8Yh7Hr9aaNg+/769uNW20sNqnRAtRFdHUyWazE+UuicMOI
	Cty4DT4kssz3JLpV4TREoorsDZFkxOaW7zVmkIdxM/EI/z9ze9HyM/wrphY6uLTXO/xQo5IA0
X-Gm-Gg: ASbGnct/Ps/lCsw3i0WwyZMo5BbeUTpDiIZug9GKSgfGnVP7uV5AKboDC4uObWcIstY
	9MlJ81izaHMmiJg31lifSdZgri+HkaICoEOm1MoECIXH4+D+ksKbGZHMQvXERKo18jk8oHII1Fl
	unvJVcVGXAnb5hSbY1QsPm9WlTg3ZnCNf6kBWxFxIX6IOMU+FRfL8JSXsJTnxqN1WX8sqITtQiS
	t09MLTMVq7/4suLX+glPnSQMX0DxIYJt6BN6xN/22G/mE//QSncIH6LgfR+SizcS8noNDKPOVCp
	Im7ZC9d1K2t8pEqJMCrw7OYKfwxSO79H+apSJowHLYZCvXFQTu+ffhv3rPT3+5Y9FmBEwBd/IsR
	qfOdRfvudkmtEoym285DdW4M2fQ==
X-Received: by 2002:a17:90b:48cb:b0:340:6b6f:4bbf with SMTP id 98e67ed59e1d1-34171906f57mr8607448a91.18.1762330469013;
        Wed, 05 Nov 2025 00:14:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBLHcD1ihGxHw3+ZXvzP7Df6ET3pXGOZUuiQEAPWgWQ0LKuy3Udojl0K87gmguoGI/Wf9FvA==
X-Received: by 2002:a17:90b:48cb:b0:340:6b6f:4bbf with SMTP id 98e67ed59e1d1-34171906f57mr8607388a91.18.1762330468055;
        Wed, 05 Nov 2025 00:14:28 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd6a10f8fsm5374043b3a.68.2025.11.05.00.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 00:14:27 -0800 (PST)
Date: Wed, 5 Nov 2025 13:44:21 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
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
Subject: Re: [PATCH v6 00/14] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
Message-ID: <20251105081421.f6j7ks5bd4dfgr67@hu-mojha-hyd.qualcomm.com>
References: <gh1Ap54xdQJqBEHQnzjGUqQsyHQgLp5ggPTjje49OhydkkjnXH2xrFWPcAwSsov_yLqCo2DRqh0F_y9aM3opOw==@protonmail.internalid>
 <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
 <66b2d9bc-c8cd-4517-aeaf-25a2de6c46ef@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66b2d9bc-c8cd-4517-aeaf-25a2de6c46ef@kernel.org>
X-Proofpoint-ORIG-GUID: 0wcyK3mhF_Vmp3nD4Ff4BEC0OAiCUaYT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA2MCBTYWx0ZWRfX9XlNhk2umEq2
 THd5CDfignVChpLlpI9vg5KznU37E3b3VeCagPPq9xQ4e+iv+nud50JtD9vKJVTcz7cheYeYCq8
 ObOGcjYgb+zFx0jk85EPgWJE4he5oB1yqBGqdp+VAhhWkPAUGyl9KzK9u8JhRAovmzr2ccIX4qE
 e/kJ9gpCKPcF43Ko57nHDfLA+n7kdGxZElQefETn4D1/HrVd/TkFENjycDlp9GpkSA6y9WwDcKs
 VkT8ZerBgfKm+rBshT2wCdy7XVmmqGBC616MHvGzxexihzBznCWkdo2Vi/BTobZojaMjZuvH940
 0B4nbmDznpFK2XfttZp0faaYoMJT24OYTtAQYPVZrDOV1qrs18jv0nVjqW9SmW29j23x7EJPPMp
 dNc2bvssCHphC5V42CAwzZMqlKbD/g==
X-Authority-Analysis: v=2.4 cv=KaXfcAYD c=1 sm=1 tr=0 ts=690b0766 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=VeCm99zmW3NvPqzZHlMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 0wcyK3mhF_Vmp3nD4Ff4BEC0OAiCUaYT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050060

On Tue, Nov 04, 2025 at 04:25:26PM +0000, Bryan O'Donoghue wrote:
> On 04/11/2025 07:35, Mukesh Ojha wrote:
> > In May 2025, we discussed the challenges at Linaro Connect 2025 [1]
> > related to Secure PAS remoteproc enablement when Linux is running at EL2
> > for Qualcomm SoCs.
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
> > It is based on next-20251103 and tested on SA8775p which is now called
> > Lemans IOT platform and does not addresses DMA problem discussed at
> > [1] which is future scope of the series.
> > 
> > Changes in v6: https://lore.kernel.org/lkml/20251013-kvm_rprocv5-v5-0-d609ed766061@oss.qualcomm.com/
> >   - Added comments made by Bryan to save some cycles and added in 2/14
> >     which could change patch order.
> >   - Renamed qcom_scm_pas_context_init to devm_qcom_scm_pas_context_init()
> >   - Replaced devm_kzalloc with kzalloc for output_rt in scm function as
> >     remoteproc framework does not usage devm_ api for resource table
> >     pointer which is cause mem-abort issue start/stop test.
> >   - Removed union usage and redundant code from qcom_scm_pas_prep_and_init_image().
> > 
> > Changes in v5: https://lore.kernel.org/lkml/20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com/
> >   - Replaced minitems with maxitems.
> >   - Addressed comments made by Bryan, Mani and Konrad.
> >   - Fixed some of highlighted issues in v4.
> >   - Added a new patch which removes qcom_mdt_pas_init() from exported
> >     symbol list.
> >   - Slight change in  v4's 5/12, so that it does use qcom_mdt_pas_load()
> >     directly while it should use in the commit where it gets introduced.
> >     Hence, reordered the patches a bit like v4 5/12 comes early before
> >     4/12.
> > 
> > Changes in v4: https://lore.kernel.org/lkml/20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com/
> >   - Fixed kernel robot warning/errors.
> >   - Reworded some of the commit log, code comment as per suggestion from Bryan.
> >   - Added support of gpdsp0 and gpdsp1 and disabled iris node.
> >   - Add R-b tag to some of the reviewed patches.
> >   - Rename struct qcom_scm_pas_cxt to qcom_scm_pas_context.
> > 
> > Changes in v3: https://lore.kernel.org/lkml/20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com/
> >   - Dropped video subsystem enablement for now, could add it in future
> >     or on a separate series.
> 
> I specifically think it is the wrong thing to do, to drop video enablement
> from this series.

There is no dependency of this series on video enablement. The only
reason I included it in my initial series was that video or other
non-remoteproc subsystems would need to call the resource table SMC call
and map the resources. Since I have dropped video support have dropped
the the helper function too that parses and maps the resources in this
newer series, it is no longer required.

https://lore.kernel.org/lkml/20250819165447.4149674-9-mukesh.ojha@oss.qualcomm.com/

> 
> Its just papering over the cracks. The right thing to do is to have the
> technical disucssion and agree a way forward, not to drop things that feel
> too contentious.
> 
> What's really so contentious about
> 
> video-firmware {
> 	iommu data here
> };
> 
> As has been done with ChromeOS on venus thus far ?
> 
> All that has to be made is a case for it.

Since there was an objection to removing the Venus YAML from the Iris
YAML [1], we cannot use it. We had a few similar use cases as mentioned
here [2], and you were part of all the discussions and agreed to remove
the item that could take time [3]. Therefore, it seemed valid to drop it
for now. A new approach[4] for video to handle these kind of sceanario
has been posted.

[1]
https://lore.kernel.org/lkml/20250823155349.22344-2-krzysztof.kozlowski@linaro.org/

[2]
https://lore.kernel.org/all/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/T/#m9891945187671417f25f134097383b72aa7f47c2

[3]
https://lore.kernel.org/lkml/ad5a58a6-2545-4429-9388-e8ad84319570@linaro.org/


[4]
https://lore.kernel.org/lkml/cover.1762235099.git.charan.kalla@oss.qualcomm.com/

> 
> >   - Addressed most of the suggestion from Stephen and Bryan like some
> >     remoteproc code checking resource table presence or right error
> >     code propagation above the layer.
> >   - Added leman-el2 overlay file.
> >   - Added missed iommus binding which was missed last series.
> >   - Separated qcom_mdt_pas_load() patch and its usage.
> >   - Patch numbering got changed compared to last version
> > 
> > Changes in v2: https://lore.kernel.org/lkml/20241004212359.2263502-1-quic_mojha@quicinc.com/
> >   - A lot has changed from the V1 and a fresh look would be preferred.
> >   - Removed approach where device tree contain devmem resources in
> >     remoteproc node.
> >   - SHMbridge need to created for both carveout and metadata memory
> >     shared to TZ in a new way.
> >   - Now, resource table would be given by SMC call which need to mapped
> >     along with carveout before triggering _auth_and_reset_.
> >   - IOMMU properties need to be added to firmware devices tree node when Linux
> >     control IOMMU.
> > 
> > ---
> > Mukesh Ojha (14):
> >        dt-bindings: remoteproc: qcom,pas: Add iommus property
> >        firmware: qcom_scm: Remove redundant piece of code
> >        firmware: qcom_scm: Rename peripheral as pas_id
> >        firmware: qcom_scm: Introduce PAS context initialization helper function
> >        remoteproc: pas: Replace metadata context with PAS context structure
> >        soc: qcom: mdtloader: Add PAS context aware qcom_mdt_pas_load() function
> >        soc: qcom: mdtloader: Remove qcom_mdt_pas_init() from exported symbols
> >        firmware: qcom_scm: Add a prep version of auth_and_reset function
> >        firmware: qcom_scm: Simplify qcom_scm_pas_init_image()
> >        firmware: qcom_scm: Add SHM bridge handling for PAS when running without QHEE
> >        firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resource table
> >        remoteproc: pas: Extend parse_fw callback to fetch resources via SMC call
> >        remoteproc: qcom: pas: Enable Secure PAS support with IOMMU managed by Linux
> >        arm64: dts: qcom: Add EL2 overlay for Lemans
> > 
> >   .../bindings/remoteproc/qcom,pas-common.yaml       |   3 +
> >   arch/arm64/boot/dts/qcom/Makefile                  |  10 +
> >   arch/arm64/boot/dts/qcom/lemans-el2.dtso           |  41 +++
> >   drivers/firmware/qcom/qcom_scm.c                   | 387 ++++++++++++++++++---
> >   drivers/firmware/qcom/qcom_scm.h                   |   1 +
> >   drivers/remoteproc/qcom_q6v5_pas.c                 | 166 +++++++--
> >   drivers/soc/qcom/mdt_loader.c                      |  43 ++-
> >   include/linux/firmware/qcom/qcom_scm.h             |  30 +-
> >   include/linux/soc/qcom/mdt_loader.h                |  22 +-
> >   9 files changed, 593 insertions(+), 110 deletions(-)
> > ---
> > base-commit: 9823120909776bbca58a3c55ef1f27d49283c1f3
> > change-id: 20251104-kvm_rproc_v6-6329e4d594fe
> > 
> > Best regards,
> > --
> > -Mukesh Ojha
> > 
> > 
> 

-- 
-Mukesh Ojha
