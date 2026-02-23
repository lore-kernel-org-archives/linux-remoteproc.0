Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAC730C368
	for <linux-remoteproc@vger.kernel.org>; Mon, 23 Feb 2026 17:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771866903; cv=pass; b=kdG6BaKCevXXVPtvhlso+OuQh5KN7YqkwosCCdSseUoIQ4bELnkzUstQXifKIz5hppPGwzK2xnlhuIbHqBiOFNGvCVnP7vF4xedUnhT7nv7D4sg6nblov87fFJ+YztxSSgC0uF5OOZ/bK+qSydCajVTLZ+qvwNIJvjTANQkrkvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771866903; c=relaxed/simple;
	bh=sivTHWD9LX85++nV1/o9kB35p/6TtEGtO2ZvoL3f5Dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fPgr8O9lTtsW3hrDlM1UGlgCOb/30Ju4aq7E4kAE0uMz2SoFexlqHVDB2fOQ4sP1kMxqsSTrzx3ZjiktYi6zZ7egGvaGtomJLdpAqkHDu7yycqJQJ3O5BNkiEOZxyqjqQI5e3D3FUqFtq+17ZXT8/naEqFgyA1r45DNnWLijHG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V+xjFPlX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f7AvrP4+; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V+xjFPlX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f7AvrP4+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NGvfrD3478855
	for <linux-remoteproc@vger.kernel.org>; Mon, 23 Feb 2026 17:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wh7kU6ZDVbvD/9tP6ZOLZ53B
	u1ldM81AwUKEiVq1unM=; b=V+xjFPlXZagKk5j0l0qOtnm90VoROFpw19JzGSZ1
	c5FjEKAQw8qPznNKya7lDKd/1dfdXl05/8Zws1h9KqtAzvmRDn6lp7h7AmrlCQbT
	I5U6IBuIOnNqaS0BYsE3i2DQaHXgcI0XaZ1X4OntdA0xnRecFEScpYE1+EQd+o+z
	pPykmIBnQR6cr5oEFXLgxXiBC5hq8RN0Z1gFAaAgrKLIjGd5E8+ubsmAbGTlVh73
	o0TSuI/A9d+fKAGfd1vOn48Zb0vIBgF8FuWfDXZvYDuCgt8QpIWyZdj6XYbE0/gU
	E+Xu0KJbz2keqLG7y9Gv1P65MeZiNwH0UI9kXT/loSjp1Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtv9r2ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 23 Feb 2026 17:15:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a863be8508so49296495ad.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Feb 2026 09:15:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771866900; cv=none;
        d=google.com; s=arc-20240605;
        b=dK6kdko+atBlmRKvwc9B1Fz0d0yjN+Y4lCD0UZLsBRFFKqhqgRJkDQDWMmBUguYo67
         Ji2ahJYfLLNK+w3vRAOJzU1woGngiY+F+Vz7HpKcnEFDwiHoofIylI5HQh9/TZmqO2us
         EC/Gz4cCHYmS8xIiuMIspAZQ8TeZFblDR9CO8hYVY8zu70Qy/a/UwV3akmGQBLLedspD
         uHRZh7vc58dVZuoUmXPysizQdC/epjkPTcABF+ENU7WsuujB+ZkF6EUvvRIi2CALKvQq
         9t0I0KfuX3jNHylt+M9G6yWcXFHD2TUML24q4zN0ND85Cmx3SbZh1WkKyZHGkZ7DCWaM
         RgIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wh7kU6ZDVbvD/9tP6ZOLZ53Bu1ldM81AwUKEiVq1unM=;
        fh=FJg1mFXv1dqNdIR+CeNi+y5UIPAbBfPEQgAgTyRekjQ=;
        b=Lbh+GFd/8Ljmg0BxFuh+dcGiErctuyRQ7SXVZR40/mcJnpb00fd0yNkNmCnMXKoptw
         VHTSBXH4fUQ+6Z0qXojNo5gCMs0OJCZDpor9MD09l+UuIGfbletZEjdyYkCz40xBudt8
         AAtuV0er07QLCX778ZHZud9LveMCKRa7S9Mqo3+NJf/2uhpu3gxvpLuvl6zuptSmuBcY
         GrTahTS5Y7mF0ic78NCBKoP4hTTpMlkpOeWO+91xdhVcZoBzoFc37+elefUMWHeSy1l1
         DVU034ul4890rpxfBX4IVC9ipG5H/g/fO7+54eIO9BsIWLKOIx3/8m8ERUHibw/ShQts
         3eiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771866900; x=1772471700; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wh7kU6ZDVbvD/9tP6ZOLZ53Bu1ldM81AwUKEiVq1unM=;
        b=f7AvrP4+BVyA4Iv1Ehcyt8FYyiEFXf/OWvlu8ReTCLZTu6BJMUGE/7dXYlytKCG8WR
         NdLDE3viDxpjfmf4hKNgh0cB5eku+RyAss0ZiDly5uc0MB3gjM5Jdu5SX4eKpMP4ie1j
         cVCubcLDpt0Ecu7AaMzHsO55hfCAjALw2u7ow4eL+7sWKxXQrS0YANon8V2dLdbbqrBv
         hoD3IH5uACI7BJ47CPayFu8kEocWxSvND6TqV5QAvO+n7JGfr2TSYTVAulLuyFWpU0Rv
         TGLLBiSI+3JSCAIsrDq3RAWV3xhJfPyGSRT/ga+/UaNxmYvzhvBO0WoLLKkhN5MPcoK9
         73ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771866900; x=1772471700;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wh7kU6ZDVbvD/9tP6ZOLZ53Bu1ldM81AwUKEiVq1unM=;
        b=WQqlZvn5IJRFvhbgjdcQ3BGcttk1iw7BvLqr9sKfeuo+dMnFtn97egqAf6OjKZUcym
         H5kN4v1V0eTtaooBlRY3S5LAVBPwrsj0jAb1nYPIWeZ/GKa0IvGIkPuLwHLxXfkT4PBu
         IRWd/J5pTWV5B02Ob+53uRlD3Cj/LNE3yHrY9K0d+LhmxkY61EO3Rxg6Eu8d5ZtDtL4w
         fPf1Zf3pyA9fnEU6Eq+epsdi7Dl21ajUdNj/FajVe52pfkdg+6v6LAOOvZNuao4TYrJ/
         Q7EwuTeJKgMcWmeWT2aToct8rjIQR2VF7brD+d7Yn/tFtHZOEF5B9YYhpYA5nvFmXTJ/
         VHRw==
X-Forwarded-Encrypted: i=1; AJvYcCV0ANxOn5Sp+avGCEN759kElqa2Kmao/18iuThIDcN1U2krPQtb5D7BSJ6RkelMtuxsOnIKw5IUXKm2W9ENK/lh@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyp+YqH0z6FtiBsujNGV5BP8ZFMp2iYTB6o1nqT8Qbum67Slvd
	37Qfvjo1G57+bqjkrPSNfMVpTWxgbgVcIezlyk5mY/rCHiWOMoHF2vmQLTyWFMEC2LPAcBbQiyQ
	UFK2qyoOzF1TSfHhBzran5nKXd4QWgEx5m8YLrJGJm3vEFnimlcxPANNq+gKEqiPiDftpTdu/bc
	yZ6VSDFVA6U2EBwghpuImutqYTFhNAKMQLz/ADl/AtREJvwc8=
X-Gm-Gg: ATEYQzyXenk1HP+whHfP1UcZrSVIR677j4qsUiFxiY3mH4lelz0VdtofndDzKTVc7S8
	SuGmfuXvuGW9m7LRRMyorgcQJoUbQoB1LwMBijBF+RSACgIPQDGqu66eaN0vkVZ+Pip0OvPwi2P
	yHMe1Z1pI2OEIIIOpo1KDfEWri0KYqS6RHI1JRoqVaD3uPTLWL8afg25TkgedzPTomRx3hcDDJ2
	LCye08=
X-Received: by 2002:a17:90b:4d07:b0:356:9405:759d with SMTP id 98e67ed59e1d1-358ae7fd547mr9439341a91.9.1771866900334;
        Mon, 23 Feb 2026 09:15:00 -0800 (PST)
X-Received: by 2002:a17:90b:4d07:b0:356:9405:759d with SMTP id
 98e67ed59e1d1-358ae7fd547mr9439301a91.9.1771866899637; Mon, 23 Feb 2026
 09:14:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com> <e658b473-6f05-4f83-a730-e586068d8742@oss.qualcomm.com>
 <sgomjvhwnnbvuskxqfybczvxtwn2lourr5eq4mw4qyxp5s6kzc@ccgx4wn5wqi3>
 <24973bc9-a082-42ec-89f4-12758ddca136@oss.qualcomm.com> <yaunylao3nefmhbdovpfoymy63hjfjtvbwm5quqvdyk3enpno6@7rmpnx7esdhs>
 <8d96ebc8-67e2-424d-adbc-0948dd3641a0@oss.qualcomm.com>
In-Reply-To: <8d96ebc8-67e2-424d-adbc-0948dd3641a0@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 19:14:47 +0200
X-Gm-Features: AaiRm501mLQQ8EL4TUeJKdJtQPxrmINvjfQ-5i--0rLisA6GLW_3SyuzX8m0n54
Message-ID: <CAO9ioeUSJQC685K47qMBn51r7APReO9T+h_K3bZ_94Uwn1unBg@mail.gmail.com>
Subject: Re: [PATCH V3 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, robh@kernel.org,
        srini@kernel.org, amahesh@qti.qualcomm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=Vaf6/Vp9 c=1 sm=1 tr=0 ts=699c8b15 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=iTchkLz9Y-giF9P-svAA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE0OCBTYWx0ZWRfXwb8vSBXUEfpG
 BCmC0a02w6g99hGb9j+Zpo68okltoyP3nhqqv7AEFGYL4sl7SE4tV3yYzSsmdAkD4ZCEJT7Xg5T
 MLIZSWEj7r7gW7TnyGXNwD2mk7vrx25Oo7pxo6zuGWu2+WU6bP4kX3ywcIOfEDA33OoLtL1E8nn
 RxsDDu4nSX5G4l/VOuyPgFh62YKavUNbusLb1Z2iGkCmG32P4hMKOs9X1W0/Mf+9/o3u6nya8RK
 z2D1G3aU+G4PnoiUYO+uLuKKJhTw3gvMBbNXougT4DWepE4me0/KlP1XGQJdLgv8JC7KHLNHFle
 drR0fP8uHU7yq+DkJcE0R2FRcc+VlWAPMvLix8RGHGmOg+NNS3aUraw9+kQN29LJB9uW1jP7KEG
 pH3v3bPXETcCF0dhtJBrAyYan07tke0gc+K7hGtUEZPeXX3EcfEgJrvA0DyILQ8Xlk9oSraWb8C
 m4z8BXdTk+tWUAxorPQ==
X-Proofpoint-ORIG-GUID: JmI9w8OWyiLa8mhJkysKmMDwnmubUzns
X-Proofpoint-GUID: JmI9w8OWyiLa8mhJkysKmMDwnmubUzns
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230148

On Mon, 23 Feb 2026 at 11:09, Sibi Sankar <sibi.sankar@oss.qualcomm.com> wrote:
>
>
> On 2/3/2026 6:09 PM, Dmitry Baryshkov wrote:
> > On Mon, Feb 02, 2026 at 11:16:19AM +0100, Konrad Dybcio wrote:
> >> On 1/31/26 8:54 AM, Dmitry Baryshkov wrote:
> >>> On Fri, Jan 30, 2026 at 10:55:24AM +0100, Konrad Dybcio wrote:
> >>>> On 1/29/26 1:13 AM, Sibi Sankar wrote:
> >>>>> Enable ADSP and CDSP on Glymur CRD board.
> >>>>>
> >>>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> >>>>> ---
> >>>>>   arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
> >>>>>   1 file changed, 14 insertions(+)
> >>>>>
> >>>>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> >>>>> index 0899214465ac..0eed4faa8b07 100644
> >>>>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> >>>>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> >>>>> @@ -487,6 +487,20 @@ &pon_resin {
> >>>>>           status = "okay";
> >>>>>   };
> >>>>>
> >>>>> +&remoteproc_adsp {
> >>>>> + firmware-name = "qcom/glymur/adsp.mbn",
> >>>>> +                 "qcom/glymur/adsp_dtb.mbn";
> >>>>> +
> >>>>> + status = "okay";
> >>>>> +};
> >>>>> +
> >>>>> +&remoteproc_cdsp {
> >>>>> + firmware-name = "qcom/glymur/cdsp.mbn",
> >>>>> +                 "qcom/glymur/cdsp_dtb.mbn";
> >>>>> +
> >>>>> + status = "okay";
> >>>>> +};
> >>>> Please make sure it gets to L-F (only Kaanapali is there right now)
> >>>>
> >>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>> Hmm, looking at x1e80100-crd which references qcom/x1e80100/adsp.mbn,
> >>> but the firmware in linux-firmware is (now) targeting IoT devices,
> >>> should we use WoA-like names for firmware on Glymur CRD instead
> >>> (qcadsp-something.mbn). It would match what was done for the SC8280XP
> >>> CRD.
> >> I think it's simply time to stop pretending the firmware is generic
> >> (some fw simply isn't and some fw may come from different/incompatible
> >> branchpoints) and include a board name in the path
> > Well... CDSP is usually generic, except for WP vs non-WP.
>
> Hey Dmitry/Konrad,
>
> Thanks for taking time to review the series :)
>
> The ADSP/CDSP firmware that got upstreamed to linux-firmware got their
> functionality tested on Glymur WP CRD devices.  Given that the firmware
> has already landed, can I continue to use the same name as the patch and
> have a different name for other boards if something specific has to be
> pushed
> for IOT?

Thank you for a prompt reaction, it took just 20 days. During that
time we could have fixed WP firmware filenames, but... linux-firmware
got released just two days ago, so we can't fix that anymore. Now we
don't have any other option than to use a non-standard name for IoT
firmware when it comes later.

>
> -Sibi
>


-- 
With best wishes
Dmitry
