Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67892F744C
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Oct 2025 11:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759924593; cv=none; b=SszQeWKrvuQlE4UjI0fJi9QtRH0C90NLeNwL9PAJuXukCGX5ke6jpsifntCUmc9MryIfxLkshQFXLl/v3TDGvAxeoDZnWheuWT/VkwUY91E6WCkT9WRMPqe7lodWqEy/UV38jyOsLvmRoR0bCY4dubVqD4ATRHjtCjQdaTWrKtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759924593; c=relaxed/simple;
	bh=lTDgga8MBX26FDIM9uxD9CEVoactIApmKXI7vkta5zU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEol83g/ncfsvTqIFhUBWHC06Oi/CF3AgBPMehswuVh1wqeAyz2vaIMe3DBBjaVurQk6F4gQpRAlmffddbriXdAmsZ/XfiPFtOn9tow+PRMj8Th9+TkOzDBWoMg0THS7UrE6n8Wsd5GoLod8biV3qNAnMgTviDcMfkIMA0u0u/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CtLQqwSQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CtLQqwSQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890apA002267
	for <linux-remoteproc@vger.kernel.org>; Wed, 8 Oct 2025 11:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f1knxwE895h//Uk+NLRtt7Bk
	s2juXaTkC3N0JijxtuU=; b=CtLQqwSQO639oW91NwkqOA2tgo457a0R3ad7To39
	dZ1GYvsm8ttIJZXIosAI+25Lzum1CCZAx+SSytWAUr0k+pm/kHz8GUs5m5lRrAIh
	W7/ZRcyU0viA9a6UIrW8qMXltd+50Kee3bx0deJ6KgU9jhUUIffLEwWz6b6aG+L2
	w3/9TyBui7yvgmrHVAF6RZHGnafTaB11G4V9qY+W1JrTtoAo2KUj7IUIbroefhPf
	6NvB6CWMMx7EhUoA7akbS+UT8MqJHjynroTOFmiNlOQGXufU1nN1KA8RTgYPVjwu
	pxtZ/7vZhdHHzIh7ew/Npi2VQsnPOODquwfkfUM0OCB71w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxnakxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 08 Oct 2025 11:56:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33274f8ff7cso11333877a91.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Oct 2025 04:56:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759924589; x=1760529389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1knxwE895h//Uk+NLRtt7Bks2juXaTkC3N0JijxtuU=;
        b=az6c4P+ZFllTPTBe5FmzcsQj7k6QK5rx/NNoeqOCdkhfct/e4iUmlqiANte/jXyffa
         ydt0lH5wvaIiWOWf4ruyjWXI3YDAgDuNRyswyx5vcvIIso5vskiOzyAXA/9O3jihSFKk
         thJ773H2frhocfVT9iVJjYY0xugQ6xAl5MdyJvJwuGa+Jmv8i3uRWs0WFpmqr3VL+mEc
         qOphB8CUsocyniLhaktK584HTsiVHlDSeP7nHY9+UwkAIw+3Tg+Zde2eWIPCnftEX1bn
         GlaDgO5HKZbdt/W6HY8UBUc8mjw8/wODqdU6mWTS5OgiXE4VY05DibVh2BJnw9XuAx9Z
         TOxg==
X-Forwarded-Encrypted: i=1; AJvYcCVZAXf/wZzctWi6+8+XObkEtgDr0k5MD1oRnqBSY4Ly7P+4PKgL0WNjmKyVYi9/QQxSbsLLPWJ9V7ArZR1VlYeU@vger.kernel.org
X-Gm-Message-State: AOJu0YxKSQzLyghDj4BhcyeyP5qLAwjGIC295L//E2QJy47XBrZ2mttn
	l2dB6ulTpy3ceZEKQn8YgR/hkgy1vYSzm9cfPCjLulJfntBbvhJIJ1Zz07DxJwH+MR0pNqOLvjK
	Jj6dFAsNaLluDdAjMMDh5tn6HdCPMB8jRukM2Ew1iA/LXWMc7lpIBwKMwntNMGUnfNBhqBA0n
X-Gm-Gg: ASbGncs2MWazy6ChlpbLkj9EjnO78f2yO0XVEOKy8Y6yfnn1eqP31Mbz3Oo2YDg79r+
	zMqpsyWLwxcjDo300JttxaFA7fEicYkp8ILd612FePR8ip8wsUvhWKx+c4gKE8iA2i226dcVsoO
	pkailoO0BU+MES0g34CXO4jK+AkjgNFxqR3h7SDbidCDp3Z4HQeszgG+bNyeyAY0zaxfh7XqW5L
	QtxhCIBnV8C0o8hR0oQo8fX1bOnC3KHqCsYkqQGcp+euCJM7zVMK/PDn9HqFReQ4gtHlFjhJzk9
	I7iTz9AIFXm7JdOypjiq8EgO7HJW/RB/ioZuxavGaKfi/+8Wd90WruyGGXpFYZTjTYTCvfa/
X-Received: by 2002:a17:90b:33d1:b0:339:d1f0:c740 with SMTP id 98e67ed59e1d1-33b51149673mr3944059a91.1.1759924588778;
        Wed, 08 Oct 2025 04:56:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4vjV+Vlhpo1bxX4HVDR2AOqNRI4QSe2mg82Psqm/L0rIOyNsw4ssPAJ9H8Pf7ehrhuUjFjg==
X-Received: by 2002:a17:90b:33d1:b0:339:d1f0:c740 with SMTP id 98e67ed59e1d1-33b51149673mr3943999a91.1.1759924588104;
        Wed, 08 Oct 2025 04:56:28 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6311462b24sm7363069a12.37.2025.10.08.04.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 04:56:27 -0700 (PDT)
Date: Wed, 8 Oct 2025 17:26:21 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 12/12] arm64: dts: qcom: Add EL2 overlay for Lemans
Message-ID: <20251008115621.xogashum3s4auqah@hu-mojha-hyd.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-12-de841623af3c@oss.qualcomm.com>
 <yef5jtmcfuks2w2sngxr4a4htihxx4xidsgwpro6wckbfvmvvn@jfr3dlsdf5vm>
 <20251008073214.kcanrljguox2vtzq@hu-mojha-hyd.qualcomm.com>
 <5408daec-127a-4fdd-88f1-855c90694f6a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5408daec-127a-4fdd-88f1-855c90694f6a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX9JnyWaUrzf8i
 vatTbYs+l8B0jdaWAThNAfjgwjBNcP4j4Mp2DXSByN0OkDPE8xri60/W1+IGbOB71pJG+vTRPmE
 0vcn0McF1k8kTTxZ5vEHak5fm+fRfCWY3uUF8brMZXZSI+0Sesp7SYNQoe9HRkHMid/Pz/jqq0K
 UUleUb1/bjrluRE4Ib0d7oTiClyj9Du+rjjCggViN2Unvw9SXRbZv+uzHT+Q0F4UKwULPzJV4kG
 /qXS3bqILeaS2pXz4BaTJcBOJT/f2HJv2NcAtHgpFXJuav41PMTxAYMW8aK0lpSVb5NOk8No3yq
 WGUI0q5A/OOR9y8Ex45KDdbhJqNjZeJEJruFXQU9NUWQ9D713XXJuRrwSML0L40T++0rDzApdwb
 Wm78hJ+m6aHPNds/y/D57vFtLGcL8w==
X-Proofpoint-GUID: wni8agFQERpu7Paf54uc47H4T-YJIcze
X-Proofpoint-ORIG-GUID: wni8agFQERpu7Paf54uc47H4T-YJIcze
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e6516e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=mJOJxhs_1O9UuuOt1LYA:9 a=CjuIK1q_8ugA:10
 a=eSe6kog-UzkA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

On Wed, Oct 08, 2025 at 12:13:03PM +0200, Konrad Dybcio wrote:
> On 10/8/25 9:32 AM, Mukesh Ojha wrote:
> > On Tue, Oct 07, 2025 at 02:55:04PM -0700, Manivannan Sadhasivam wrote:
> >> On Tue, Oct 07, 2025 at 10:18:57PM +0530, Mukesh Ojha wrote:
> >>> All the Lemans IOT variants boards are using Gunyah hypervisor which
> >>> means that, so far, Linux-based OS could only boot in EL1 on those
> >>> devices.  However, it is possible for us to boot Linux at EL2 on these
> >>> devices [1].
> >>>
> >>> When running under Gunyah, remote processor firmware IOMMU streams is
> >>> controlled by the Gunyah however when Linux take ownership of it in EL2,
> >>> It need to configure it properly to use remote processor.
> >>>
> >>> Add a EL2-specific DT overlay and apply it to Lemans IOT variant
> >>> devices to create -el2.dtb for each of them alongside "normal" dtb.
> >>>
> >>> [1]
> >>> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> >>>
> >>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> >>> ---
> 
> [...]
> 
> >>> +&iris {
> >>> +	/* TODO: Add video-firmware iommus to start IRIS from EL2 */
> >>
> >> So the missing 'iommus' property is the only blocker to enable IRIS?
> > 
> > Yes, but this would require some changes in the driver as well to create
> > a platform device for the firmware and IOMMU domain, and to attach the
> > firmware device to the domain.
> 
> "yes, but actually no"
> 
> > 
> > There was some discussion around this in v2[1], where I added support
> > for video. However, the change involved hooking into the video-firmware
> > property, which was used for Venus.  There were concerns[2] about following
> > the same approach for Iris, and due to that, we have dropped video
> > support for now.  However, an RFC has been posted from our side to
> > handle such scenarios[3], as of now unclear about the direction for
> > Iris.
> > 
> > 
> > [1] https://lore.kernel.org/lkml/aKooCFoV3ZYwOMRx@linaro.org/
> > 
> > [2] https://lore.kernel.org/lkml/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/
> > 
> > [3] https://lore.kernel.org/all/20250928171718.436440-1-charan.kalla@oss.qualcomm.com/
> > 
> > [4] https://lore.kernel.org/lkml/4a32bbec-2baf-4210-a7c1-1ddcd45d30c8@oss.qualcomm.com/
> 
> Reword the comment to "/* More driver work is needed */" since there
> is nothing more you can do at the moment and you most likely don't
> want to block your series on resolving the above entanglement

Sure.

> 
> Konrad

-- 
-Mukesh Ojha
