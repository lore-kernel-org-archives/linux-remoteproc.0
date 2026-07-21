Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDB73783C6
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 11:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784632999; cv=pass; b=pQxl+8rpMqD5wb4AHUoofP7D+qdPoHNMM6rj2tHKYzcnPCoq8frUv6zM6dy5wbxx+HtFsPHO09GxH3r9K97Ghsysw+lTcLF1Ok05FLIeGciBUafOZEkdnIh9ibhJCTpV5jwjzUPeYutjJOv4m99pp1NIOtZUBdpPP66/60fWARA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784632999; c=relaxed/simple;
	bh=6VAx8MsHSsRET9XGAU5UE8st8JXI01ci1xclZOqmkpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I3g1keT11KYwHCeG6tKYQS+UeHXQqhouekZXfj0L7TSEmIpLBH/AJIfRnsmcrOtbrFfg5bSeZFrlIBYa69icP0L6XczF4fDi/AFHBzeaM71gHro6atmiHrjsDUOfNqDTGtNJBuUr1E7e+3UM5hvtSY4DAqP68n04Xxd5sAPYlMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YuMVsVRb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W1IBx0r4; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YuMVsVRb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W1IBx0r4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARvCx1252166
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 11:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1p6ZhkeIpwRwxNxnvxv1dr5EF7tYs7sjw5Pv6BQNvWU=; b=YuMVsVRbqqYIYTEy
	K43JAyPcUpP2ZBhjvrxmqVL5YHJXPWcWT3PPAlQR7aU5WDpGtzPCSuIsXmQrPFOb
	2zV238aBlMC4e6+GA32SMD9roGsFSNS+5DcekUa+Yl9wk3lfjpw8XwLXcODuphBx
	Ta9wD1xmBJXQYXVTZdSpVFXqlZya+WmSiu+OL5NyrzLFTG75kh3DN8yi/ncfP44D
	/MU8Rq0R7cQMesfzSCgqfii3Byiv9B0poEEjNO+IIkUqALJn2K1O1S6hNkGkUd+e
	4gzBHaLAPlbh/w1abtH8i7q00W+EWkrrIVY6cgJB3VD7KB0SRc0EG7yZQ+K8KRvg
	820hlQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqvcc5e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 11:23:15 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-737f1f1e0e5so2929014137.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 04:23:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784632995; cv=none;
        d=google.com; s=arc-20260327;
        b=XmIgCW33CQ+r62sd6NqEOFYV1O4mpZAArwLUw1rgB10NaVkZPlJh19pCuY9n6gLVyT
         sFbI0VwZYxaBeNYH6HUXW3+/PvCP6YU+0UP9pX5U9swE/XSXjDVf0epAsPGbfOTO72f5
         RTV53aRN2siCA7yx/ZoW3xntd2OAWNY/D9EbAXxKvmGS0lBPFzxxEgAmyhNBPsK5wwLH
         AnIb/YcZx9la3pZ7+pGS3MJ8tqbMZHMhiPNs7kDjhmzoHtC+jlZVb+TRiU4klIMaWUFu
         ihOr83l+fFePL4o3F15Y92Q7ZZP+5AFwHTQM7pQws34LQJk3J+QjGA1T9AlYXkkQ6fgj
         s7iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1p6ZhkeIpwRwxNxnvxv1dr5EF7tYs7sjw5Pv6BQNvWU=;
        fh=fOrF868UDs19SRhX7mqoHS53ujgYuKit3/ZEDtoJNAw=;
        b=BhtwHzpj+q2kh3031IU6x3IP1yf4UYLuTbeHLJjQUthmDfEq1JuaoT0GQXb7ohHupe
         lDKvCC8rHE5ZQaxEQl1tP8d/1F2IX/VrkI5/T8WJ6VYmH4g4iWEUcYxkb+siER7qPfJa
         BmZoNpFd7PYUScSwwPjvYbz9M3A14Hwfg8aeMFjBIbzUMpqAz7M+vbvegcXNvBZTDunJ
         4D1J5k+argb0ypKXDUkC+tejQu5hG0gIUhVJ33r7f2atcx/7TnGUy7LIzzZiFpqIw5EJ
         aFI1XOoV/W6QtO7+h/gXaDEZZIXqpD5tWKPYvZiBnyPTPj6cmFVdzYOvCcOTaSGyRoyQ
         ojFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784632995; x=1785237795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1p6ZhkeIpwRwxNxnvxv1dr5EF7tYs7sjw5Pv6BQNvWU=;
        b=W1IBx0r4PMMUidhjaLR58s8+GL9YwdFRXMm7I1OJXgMhqyd8bqEiuHgq8AH8KjsTjm
         fKpkaPsJJzF9dDJfJ/P9HmNvvRpZTqQCOAyx7nAph87uSZXQxuku8zeeiVMHG+pCIoZ4
         ckjb3pGVJC7sZfxJ6jngs44dV9gaOBk0xE+DnZhzPMzYY57zaH8hpF79hCr68MuLhiQa
         82D3WXC3bTBvM+Y0uE/diECaPJ9bAlheLQxrSmfOBRV4BgIklfc/y7cP9Aj6OoFvr92t
         hQsOv8DtDlAsiINkzD2pmkKmJEa8jrKm7zmDTy/c+uwljcsqW8PKeMUCJ4a3JU1RqDjS
         9BLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784632995; x=1785237795;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1p6ZhkeIpwRwxNxnvxv1dr5EF7tYs7sjw5Pv6BQNvWU=;
        b=R3L1g6IEf5ZNq2/XfYKlhqUO6Fx0YiYgOAlcYRmeSdulmL6MXZCRTu6Q/hW6JwTJ0s
         q8ndAFwDnawwSJ7ZDrGmfvIM2FGM2uFx/+8lk2BACQGCSWBw05zMj9FT32WMq/CRNUxk
         NI71C0MgTfIDa9feMADd0sW3kO5HkRm/QvCYjQTSzFQvLj5xt3awmjMg9LyJIl3hruj0
         dkthSr01MC3bDT4RBKryls/5EhnETJWzf4xisbMQeh37Gx3tKAhMAJsydFgl7FwXTkyN
         w1a8K9dInnmKqm3gDqCcLIL4oW2C2nlIcL004ZHTFZeb0oNbtCgUhJ79zuM2FNNezpmJ
         s3hA==
X-Forwarded-Encrypted: i=1; AHgh+RpH8tIq1mB74/p/7OSM6wDvcuzw2F+++YLfNpwQZ2M+Unww2lUZIGJDZpDF5tcgu0NpelROQqosjWlEqSDlMGuz@vger.kernel.org
X-Gm-Message-State: AOJu0YzDSWTVLRFolMHM0eJiufqccqgkBJa3ECIO9rZepaMwZC1WGtod
	Y8Fw4dCxBL8YAWtQTxS3FW3hnvd46jEEy0HFX5SlNplZX9RTmR161wm/b1fyykVPNMUK7xyV1F1
	oYlRJ83qcarfbvxphLHd5hy+rAofp381GDDvhU8M9SJh7HdzcN4ZNmF0AIKo50Yko4zUGUwqZVX
	REYHjO+Gi7meSWCEhC6Bstww1av+AtZTFKoo2KRcC25rBKL+k=
X-Gm-Gg: AR+sD12yy/S/1HN29IRyop7kJ83DTyblrCyevoh8x6v4f4veFqYa0xBHRuC2lbtMfrJ
	5NJwmr80CYpjhIs/DanS0sERbQnSXVvXRWGS/cuq0fRQZH3xmvGnNH/iAmUtdtoHUEPGKwNmMB0
	XIUmSJW9RW6fIrk1+8Ao8DZkWW5ydk4blRea/RFAqb5A4h+Wh6+p/jQSu0DA==
X-Received: by 2002:a05:6102:1487:b0:631:28c1:154c with SMTP id ada2fe7eead31-747534b507cmr4933451137.9.1784632994728;
        Tue, 21 Jul 2026 04:23:14 -0700 (PDT)
X-Received: by 2002:a05:6102:1487:b0:631:28c1:154c with SMTP id
 ada2fe7eead31-747534b507cmr4933436137.9.1784632994275; Tue, 21 Jul 2026
 04:23:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717095825.3962666-1-pratyush.meduri@oss.qualcomm.com>
 <20260717095825.3962666-4-pratyush.meduri@oss.qualcomm.com> <20260720-romantic-radical-avocet-bccad4@quoll>
In-Reply-To: <20260720-romantic-radical-avocet-bccad4@quoll>
From: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 16:53:01 +0530
X-Gm-Features: AUfX_mzG90RYGLzUHLgWXGQR4FxlL_eJoPUeDxHiT30MTK5iRyNxHLT3Jr0zP9A
Message-ID: <CAB3tGMOSo3rmxby3dK+UgW8FSkxkaWh6mmTEbe331J__-7AHRA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: monaco: enable audio ML offload
 memory and SMMU mappings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEyMCBTYWx0ZWRfX8niKb5spJ2Xd
 gYK4pxF7uAcqCzVEcph5W1OTSQnhM5pWqZawe4bV6Y8jBUKmidP1uzfNl9FflcJDU1D5dB+Ns4N
 +aUqEe1PnIwu+9XlIieIVXi+utD0faQ=
X-Proofpoint-GUID: um8UIJ-sGAOeqY7ePajFky1GqMtn0l9q
X-Authority-Analysis: v=2.4 cv=OMYXGyaB c=1 sm=1 tr=0 ts=6a5f56a3 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Eckrb6PB2g-3wKSLlsIA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: um8UIJ-sGAOeqY7ePajFky1GqMtn0l9q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEyMCBTYWx0ZWRfX6QWE3f0rP+3U
 HzSpzmiDdpgDvjql6IfiYwdkDK7Y+g4XbPv9uQ5QqQqZldVzbO92b4DGskJqPKpzNIT37gPXFFw
 2b3n+HO4y1TctG55Ym4oz37vWTP8sDaWSpg2sseI6mN4/IqD0KncXVKuihRWaTcn4Q4kmlJEE1J
 S55zCGbUEereKPALI1uKW8wdZ0RMe7lzFkbk+cZ7V4gsbOwCcdMe+CAVInhpDMlQFMsBQvVE41e
 3xd92YPCT2wlGm285epG4k5rXMTE3LH6zHMhgAPAdtuAaOJ+R52z2d3JMNfOSpWAhyokiV2NqSI
 oMZcmzxTx2ZN0YrfYbWrxCnGsonTEoCU3TSyFDkwhaHvBFlpBTl38ltYwWtNDffaSYzVBqATwOo
 DVl4Txr4ed19BA5uIOKakHjkyMQKXXPnDtiWCETxKKF49b7vMYz1c7KU9MDvWeou3MHpF9popou
 p0QFPnOsSRHEj1SS7UQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210120

On Mon, Jul 20, 2026 at 11:42=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Fri, Jul 17, 2026 at 03:28:25PM +0530, Pratyush Meduri wrote:
> > The audio ML (machine-learning) offload use case requires a contiguous,
> > physically addressable buffer shared with the audio DSP/SPF, and issues
> > DMA transactions through additional SMMU stream IDs that are not
> > covered by the existing ADSP mapping.
> >
> > Add a dedicated reusable shared-dma-pool CMA region (16 MiB, 4 MiB
> > aligned) and wire it to the q6apm DAIs node via memory-region. A
> > dedicated pool guarantees the alignment and contiguity the DSP expects
> > and isolates these allocations from the default CMA region.
> >
> > Under the EL2 (Gunyah/hypervisor) configuration the SMMU is fully
> > enforcing, so the ML transactions are otherwise blocked and faulted:
> >
> >  arm-smmu 15000000.iommu: Blocked unknown Stream ID 0x2060
> >  arm-smmu 15000000.iommu: Blocked unknown Stream ID 0x2062
> >
> > Add the ML-related stream IDs (0x3060 mask 0x9, 0x3062 mask 0x1) to the
> > remoteproc_adsp iommus property in the EL2 overlay so these buffers are
> > translated by the SMMU instead of being rejected.
> >
> > Signed-off-by: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/monaco-el2.dtso | 4 +++-
> >  arch/arm64/boot/dts/qcom/monaco.dtsi     | 9 +++++++++
> >  2 files changed, 12 insertions(+), 1 deletion(-)
> >
>
> NAK, you keep ignoring us.

Sorry for sending a v2 before addressing all review comments.
I will make sure this does not happen again.
Thank you for the review. I will respond to all comments from both v1
and v2 and address them in the next revision.

Thanks,
Pratyush.
>
> Best regards,
> Krzysztof
>
