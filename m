Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38561378D99
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Mar 2026 08:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772786487; cv=pass; b=KjNN53jcum1djA+bW2YCzgmDTiOSi0KpZyDtEycVM7xgEWh5quqTaNuh0vDoqhGT9lpmVuR8MrqNhcGAZaOIv4jhqSFtiUUatEtfFi56kgBIanh9DMBFsR7io2+H5+3qd+ceV9kYfLqlFccqwsSW5anZYS5/RJ8aKw/mFtQnY2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772786487; c=relaxed/simple;
	bh=YVPiTvc8HSEbsl+v0TAOxckYPX6yDiMrRYbqiKFL+bQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ElOQZAu3NLFj5ZdbKKS1ffcGvGVoAjWWyIK6AJRIWQNS704pDF02J9Rfu1f9s9DS9dnJjqBqTwcEuO8B8sL65505yNQ4WuO9O0MRZAIHl+T3kNcUM0pYuVRT90lJulrmvKUrcszCK9cggkpdrLnWEYliMno16/lejfn7c1S9FQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g1tOPCek; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKFXh+DF; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g1tOPCek";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OKFXh+DF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264aTdk3219774
	for <linux-remoteproc@vger.kernel.org>; Fri, 6 Mar 2026 08:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0sAnhwFJhRCHu2yMxo3rKkoCI7pR6vsYT3BN6ZZbduo=; b=g1tOPCek5pHSdOg4
	2QNQ2ucWEMZcs57rrHH+mTWLXiNqclEI6liaAmPV0w+STL86Ny9HWKp4NIYKSVw0
	FZ/UiyJMutkzifp9iZdT44Ue//MuhU3hUXl35rSar/RkfMGyaA02ZSwseDx+jxjb
	M3fUjK+0jrE/tkYHxZ54cA91mo+ynlYh3r28J0zsoSBG0M2aMT8TmifwLG9Eyb2j
	2vc01YfYS6gq+kyq9kK3e+YAnT1yQCJeTd07Z2P8ppo/H537jwm/JDIUnxeSF9pu
	JPu0yGAx0T/BXHf9gDrr282caSu5BpR0VrfpgwVSgL+K75lCOUi/xlqR0KZMeoc3
	qYdDcg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqf25td8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 06 Mar 2026 08:41:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71500f274so955631385a.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Mar 2026 00:41:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772786483; cv=none;
        d=google.com; s=arc-20240605;
        b=FU6ZegopYY68Z15nf5oOCJUNbUifTWe6YCby/jrD+b/+wKfJUzFv3sG4Vf1pwrWTs0
         hfdz//M04peOt+9MxGufjBEzXFlJVaUgJl8OnRv3jtj5HeLCxukIONNS5RbIeGzY2uIu
         RIsHN9UaghTMdPMYvqCE3JEbPg20m0QpC91DvJWXQe0unA7U3MHc4VM7tXLGO2jyTroE
         NR5TKDjvjoKlW27XFKjEWYZyVOStqmwXHiS97+/vgSDeJ6XG7bDhKdNSJfqU/85AkPqP
         bi/mGVECrddR6UMF4K8v3ZrMD8gUgMF5hS6cZf8xuwWnGwDMmPM8wfE86e+uDzDGnF3q
         qvMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0sAnhwFJhRCHu2yMxo3rKkoCI7pR6vsYT3BN6ZZbduo=;
        fh=L1emzU/A3whAjIE5+1dkpGGhamA/ma2GgIgx1zRgPhk=;
        b=hUF9lK88zaggEMlHY7su6idWtBzK0RZpzPRzObciJ8Sm2pNjxltwY8Hkh5+MLt2CHt
         C4wzt6X053cwqJufqFQhFGH1ObbaAhE4vHXPsgyXx3wNon7pzrjY0+OrXTdvmilFw4V2
         I9OoE6j1EnLaw7gSKSyfcyQovrhGYufu+NGfdAPlb523o0Bo+pPja8URtDRE7L87nUi4
         WR2axN5lDXAq5/F80r88IW2DUNU+PTBHTXk4ufOYbYzqwPoEWy3Thj4knsMLHpS20M71
         OSu8mYwbS4k2ZxAYvObkccnBJxit0Qu9LKjbpL2K3H6BRQ2LWeBQE6P3UdT9VX34iCkv
         bkBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772786483; x=1773391283; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0sAnhwFJhRCHu2yMxo3rKkoCI7pR6vsYT3BN6ZZbduo=;
        b=OKFXh+DF384LeuZtat3m7W7zdf0e/WXA/TB2uzD2h91XwXSKre5Ud0eGOwZih2zN/J
         6a5dYwFSkWDrTV3T0Jn6vgckmBMbt6U4tebYm6Sg2bmjaefG/aKuptHYs5A/VWYzgIFo
         oQo6evZ3BRHBdXpB3bO8hKcMRMuA/AtHC3n/y8xXcoxdigsJz6oTIO5fRmNcA9qpwDbJ
         yM3KQp0WB+jYVcqepI+qvOLAxAj4sYOEpzw2w+yc3FSmtmpj4sTi/7WgkxJusbgQGaaC
         Ce9lDzjK2hfF5jSGRbD78/8sfCLoj0Lb6Ty9kW3nPAOav6RMhW54+9TZ6XdcT6rUx8G2
         32Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772786483; x=1773391283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0sAnhwFJhRCHu2yMxo3rKkoCI7pR6vsYT3BN6ZZbduo=;
        b=KYubSYiT2NADeRig6XZ1T+o8j/Djh5ubXu8u8Z3+DrD2XOZBUGMc3mdSAnphKOz5XN
         Cl6nGJPDCkRGvsfe5CFsJlCMX9wHeY3x+/+Y2MpPdASVi49WGbz4+GRrx099ljfDifQ8
         2/vmYls/NwTkU8fK/0cugnl1Q/9bijJznJZJLc3PJCPE74+9lL1bMmH6kN61hto/EKbP
         NOET5O7lO2Lw+czV+3MzTBkUwwE2e94NORn45jNXB1ZkgRk2TQegpv4fgE4Vasz308j1
         pzJiCdxABfRT/ynxBRG+2WZ8NAZ4d4Gp7razzMNZqdBtTHKL8W3QZ/vPTX4Wp81sLy//
         LmGw==
X-Forwarded-Encrypted: i=1; AJvYcCVyO8z2bUubghADxNinkWGT3q8ps3QFU5yEXebUXO7wIXPZILx8Ih4N0N0ePj58Eu8QBZCdI2xVW5BLA+v603Sa@vger.kernel.org
X-Gm-Message-State: AOJu0YzgKM48Am2t3lQ1yr2Gdxj2GU2uZ/gBlu+TVFzs9s44yxLHTVzU
	qOeZBDSznMg34MTEPceAnxNSCL8v4j42syTnemf28XvVwmITLdT2R1c0bjCbxFqKZqOt9jjp0dx
	GYVfD8AuSJwJNdh4BBTGLYI9tHAFP5E9QuHXCIFQxpyaMoWDnPJrREkJdRMBzftipB70q2MjQcj
	uoxjymT9SsMWy1Kfjz608fdzcVQX3XAF0CRweNEcWxgMpcysk=
X-Gm-Gg: ATEYQzxKxkqrweIslOZB38aKkbPfWyNo/T9jzQ1WAGvCI7xbcPJpyfF/FK12hrI1D9o
	mgNDAx01ZxiWoCn/653E+Vh4F1HJRdNppNds+MKDbhPYeX+dZet9jnE/4X4MRU01a40/d+VpCkM
	iPafjGBlEwj+08VcBae8qN0jscnVPuw1JPB7x6+2qlQsj30n9v3mEIzdA0NqpVhVL7PcaCy+iiZ
	8aieyvTs6n/j7sOzfSi+L3ttcKFfm0tny/JDg==
X-Received: by 2002:a05:620a:bd5:b0:8ca:123e:8194 with SMTP id af79cd13be357-8cd6d38ed0bmr156599485a.33.1772786483291;
        Fri, 06 Mar 2026 00:41:23 -0800 (PST)
X-Received: by 2002:a05:620a:bd5:b0:8ca:123e:8194 with SMTP id
 af79cd13be357-8cd6d38ed0bmr156597685a.33.1772786482792; Fri, 06 Mar 2026
 00:41:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306004344.10968-1-kerigancreighton@gmail.com> <20260306004344.10968-4-kerigancreighton@gmail.com>
In-Reply-To: <20260306004344.10968-4-kerigancreighton@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 09:41:10 +0100
X-Gm-Features: AaiRm50ityeSqNbLbi_vlqBFaxP1tMie2ALHub6uuVR7TUiuZkBUrj9KPTvuhPs
Message-ID: <CAFEp6-2MVFXfz4=_Em7YkH_Vx5VcryWMdDnrwe8C0=TnBmknZA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] wifi: wcn36xx: Add support for WCN3610
To: Kerigan Creighton <kerigancreighton@gmail.com>
Cc: linux-wireless@vger.kernel.org, wcn36xx@lists.infradead.org,
        andersson@kernel.org, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: amtxFfMCf8llnBh9LZp5sLTnezeEawdp
X-Authority-Analysis: v=2.4 cv=Uvdu9uwB c=1 sm=1 tr=0 ts=69aa9334 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=hsp69BweicYqoijZIzwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA4MCBTYWx0ZWRfX6EE9BLplzYEa
 0LEaYExu1HkXiXqjTMz/qtO3QUJKA8TjqnoK3yqLUSv6qSw9HAucqdFmcvN5lldVMPa+SYZ1yKH
 GYMUnBG8CoT7pZV8uYFogH+lppIzp1yJ+H3KF0DuslhADpc/1ThIj0VeD9U3vgDRu8FrV6iGe68
 Vt7Hcxku8BUltKi+9kONA7BVQyTFxhe4NzdYHAv3z5tQmjFl7kSyGeX991cWor1/lRe5rm5w3Q0
 eHjnLz5L3pa4l/uyoATUUJoUbmxZ/GxbrAsThideVyfjqWDSrBb+rt9r0OHJM7GI5j5VXvDMoAj
 B9gt9ifbnwHzFppWdF9L0S7regfz/jXXmgwWLiPMjm2hJ3wTKi5RjFzQFK4XmrAvhunLUFrOnqI
 9+LBtSkzAbobtHnYjFFtdPrdGnFcIF7tTkl0G33iT5mNjMPJnSvmuC891elzCUeUnmEy1mZ7ojh
 m1S/BAocAG4qffTEotw==
X-Proofpoint-GUID: amtxFfMCf8llnBh9LZp5sLTnezeEawdp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060080

On Fri, Mar 6, 2026 at 1:44=E2=80=AFAM Kerigan Creighton
<kerigancreighton@gmail.com> wrote:
>
> The WCN3610 has a lot in common with the other wcn36xx
> chips, so much of that code was reused.
>
> The WCN3610 requires specific configuration values for
> stable Wi-Fi. Without these values, there's packet loss.
> An extra CFG table was made so other chips are not affected.
>
> ENABLE_DYNAMIC_RA_START_RATE=3D0 was discovered from the
> downstream prima driver. That brought it from 95% to 5%
> packet loss. The rest of the CFG values came from my own
> observations and experimentation. The current settings
> allow for 0% packet loss.
>
> STA_POWERSAVE resulted in BMPS errors and unstable
> functionality, thus it has been disabled for just this
> chip.
>
> Tested on an Anki Vector 1.0 and 2.0 robot with 3
> different APs. Support for other WCN36xx chips has not
> been affected.
>
> Signed-off-by: Kerigan Creighton <kerigancreighton@gmail.com>

STA_POWERSAVE is disabled, but the interface still enters BMPS mode as
controlled by mac80211. If you get the opportunity, It would be useful
to air-capture the power=E2=80=91save entry and exit events when this occur=
s,
so we can verify that the transitions behave as expected.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>



> ---
> Changes in v2:
>  - Move wcn36xx driver changes to the end of the patch set.
>
> Changes in v3:
>  - Describe where the CFG values came from in the wcn36xx
>    driver patch [Konrad].
> ---
>  drivers/net/wireless/ath/wcn36xx/main.c    |  4 +-
>  drivers/net/wireless/ath/wcn36xx/smd.c     | 61 +++++++++++++++++++++-
>  drivers/net/wireless/ath/wcn36xx/wcn36xx.h |  1 +
>  3 files changed, 64 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/wcn36xx/main.c b/drivers/net/wirele=
ss/ath/wcn36xx/main.c
> index c3f0860873..6c90c13251 100644
> --- a/drivers/net/wireless/ath/wcn36xx/main.c
> +++ b/drivers/net/wireless/ath/wcn36xx/main.c
> @@ -1438,7 +1438,7 @@ static int wcn36xx_init_ieee80211(struct wcn36xx *w=
cn)
>                 BIT(NL80211_IFTYPE_MESH_POINT);
>
>         wcn->hw->wiphy->bands[NL80211_BAND_2GHZ] =3D &wcn_band_2ghz;
> -       if (wcn->rf_id !=3D RF_IRIS_WCN3620)
> +       if (wcn->rf_id !=3D RF_IRIS_WCN3620 && wcn->rf_id !=3D RF_IRIS_WC=
N3610)
>                 wcn->hw->wiphy->bands[NL80211_BAND_5GHZ] =3D &wcn_band_5g=
hz;
>
>         if (wcn->rf_id =3D=3D RF_IRIS_WCN3680)
> @@ -1535,6 +1535,8 @@ static int wcn36xx_platform_get_resources(struct wc=
n36xx *wcn,
>         /* External RF module */
>         iris_node =3D of_get_child_by_name(mmio_node, "iris");
>         if (iris_node) {
> +               if (of_device_is_compatible(iris_node, "qcom,wcn3610"))
> +                       wcn->rf_id =3D RF_IRIS_WCN3610;
>                 if (of_device_is_compatible(iris_node, "qcom,wcn3620"))
>                         wcn->rf_id =3D RF_IRIS_WCN3620;
>                 if (of_device_is_compatible(iris_node, "qcom,wcn3660") ||
> diff --git a/drivers/net/wireless/ath/wcn36xx/smd.c b/drivers/net/wireles=
s/ath/wcn36xx/smd.c
> index 813553edcb..8d5a746de7 100644
> --- a/drivers/net/wireless/ath/wcn36xx/smd.c
> +++ b/drivers/net/wireless/ath/wcn36xx/smd.c
> @@ -83,6 +83,61 @@ static struct wcn36xx_cfg_val wcn36xx_cfg_vals[] =3D {
>         WCN36XX_CFG_VAL(LINK_FAIL_TX_CNT, 1000),
>  };
>
> +static struct wcn36xx_cfg_val wcn3610_cfg_vals[] =3D {
> +       WCN36XX_CFG_VAL(CURRENT_TX_ANTENNA, 1),
> +       WCN36XX_CFG_VAL(CURRENT_RX_ANTENNA, 1),
> +       WCN36XX_CFG_VAL(LOW_GAIN_OVERRIDE, 0),
> +       WCN36XX_CFG_VAL(POWER_STATE_PER_CHAIN, 785),
> +       WCN36XX_CFG_VAL(CAL_PERIOD, 5),
> +       WCN36XX_CFG_VAL(CAL_CONTROL, 1),
> +       WCN36XX_CFG_VAL(PROXIMITY, 0),
> +       WCN36XX_CFG_VAL(NETWORK_DENSITY, 3),
> +       WCN36XX_CFG_VAL(MAX_MEDIUM_TIME, 6000),
> +       WCN36XX_CFG_VAL(MAX_MPDUS_IN_AMPDU, 64),
> +       WCN36XX_CFG_VAL(RTS_THRESHOLD, 2347),
> +       WCN36XX_CFG_VAL(SHORT_RETRY_LIMIT, 15),
> +       WCN36XX_CFG_VAL(LONG_RETRY_LIMIT, 15),
> +       WCN36XX_CFG_VAL(FRAGMENTATION_THRESHOLD, 8000),
> +       WCN36XX_CFG_VAL(DYNAMIC_THRESHOLD_ZERO, 5),
> +       WCN36XX_CFG_VAL(DYNAMIC_THRESHOLD_ONE, 10),
> +       WCN36XX_CFG_VAL(DYNAMIC_THRESHOLD_TWO, 15),
> +       WCN36XX_CFG_VAL(FIXED_RATE, 0),
> +       WCN36XX_CFG_VAL(RETRYRATE_POLICY, 4),
> +       WCN36XX_CFG_VAL(RETRYRATE_SECONDARY, 131),
> +       WCN36XX_CFG_VAL(RETRYRATE_TERTIARY, 129),
> +       WCN36XX_CFG_VAL(FORCE_POLICY_PROTECTION, 5),
> +       WCN36XX_CFG_VAL(FIXED_RATE_MULTICAST_24GHZ, 1),
> +       WCN36XX_CFG_VAL(FIXED_RATE_MULTICAST_5GHZ, 5),
> +       WCN36XX_CFG_VAL(DEFAULT_RATE_INDEX_5GHZ, 5),
> +       WCN36XX_CFG_VAL(DEFAULT_RATE_INDEX_24GHZ, 6),
> +       WCN36XX_CFG_VAL(MAX_BA_SESSIONS, 40),
> +       WCN36XX_CFG_VAL(PS_DATA_INACTIVITY_TIMEOUT, 200),
> +       WCN36XX_CFG_VAL(PS_ENABLE_BCN_FILTER, 1),
> +       WCN36XX_CFG_VAL(PS_ENABLE_RSSI_MONITOR, 1),
> +       WCN36XX_CFG_VAL(NUM_BEACON_PER_RSSI_AVERAGE, 20),
> +       WCN36XX_CFG_VAL(STATS_PERIOD, 10),
> +       WCN36XX_CFG_VAL(CFP_MAX_DURATION, 30000),
> +       WCN36XX_CFG_VAL(FRAME_TRANS_ENABLED, 0),
> +       WCN36XX_CFG_VAL(BA_THRESHOLD_HIGH, 128),
> +       WCN36XX_CFG_VAL(MAX_BA_BUFFERS, 2560),
> +       WCN36XX_CFG_VAL(DYNAMIC_PS_POLL_VALUE, 0),
> +       WCN36XX_CFG_VAL(TX_PWR_CTRL_ENABLE, 1),
> +       WCN36XX_CFG_VAL(ENABLE_CLOSE_LOOP, 1),
> +       WCN36XX_CFG_VAL(ENABLE_LPWR_IMG_TRANSITION, 0),
> +       WCN36XX_CFG_VAL(BTC_EXECUTION_MODE, 2),
> +       WCN36XX_CFG_VAL(BTC_STATIC_OPP_WLAN_ACTIVE_WLAN_LEN, 90000),
> +       WCN36XX_CFG_VAL(BTC_STATIC_OPP_WLAN_ACTIVE_BT_LEN, 60000),
> +       WCN36XX_CFG_VAL(BTC_STATIC_OPP_WLAN_IDLE_WLAN_LEN, 30000),
> +       WCN36XX_CFG_VAL(BTC_STATIC_OPP_WLAN_IDLE_BT_LEN, 120000),
> +       WCN36XX_CFG_VAL(BTC_FAST_WLAN_CONN_PREF, 1),
> +       WCN36XX_CFG_VAL(BTC_STATIC_LEN_LE_BT, 120000),
> +       WCN36XX_CFG_VAL(BTC_STATIC_LEN_LE_WLAN, 30000),
> +       WCN36XX_CFG_VAL(MAX_ASSOC_LIMIT, 10),
> +       WCN36XX_CFG_VAL(ENABLE_MCC_ADAPTIVE_SCHEDULER, 0),
> +       WCN36XX_CFG_VAL(ENABLE_DYNAMIC_RA_START_RATE, 0),
> +       WCN36XX_CFG_VAL(LINK_FAIL_TX_CNT, 1000),
> +};
> +
>  static struct wcn36xx_cfg_val wcn3680_cfg_vals[] =3D {
>         WCN36XX_CFG_VAL(CURRENT_TX_ANTENNA, 1),
>         WCN36XX_CFG_VAL(CURRENT_RX_ANTENNA, 1),
> @@ -632,6 +687,9 @@ int wcn36xx_smd_start(struct wcn36xx *wcn)
>         if (wcn->rf_id =3D=3D RF_IRIS_WCN3680) {
>                 cfg_vals =3D wcn3680_cfg_vals;
>                 cfg_elements =3D ARRAY_SIZE(wcn3680_cfg_vals);
> +       } else if (wcn->rf_id =3D=3D RF_IRIS_WCN3610) {
> +               cfg_vals =3D wcn3610_cfg_vals;
> +               cfg_elements =3D ARRAY_SIZE(wcn3610_cfg_vals);
>         } else {
>                 cfg_vals =3D wcn36xx_cfg_vals;
>                 cfg_elements =3D ARRAY_SIZE(wcn36xx_cfg_vals);
> @@ -2380,7 +2438,8 @@ int wcn36xx_smd_feature_caps_exchange(struct wcn36x=
x *wcn)
>         mutex_lock(&wcn->hal_mutex);
>         INIT_HAL_MSG(msg_body, WCN36XX_HAL_FEATURE_CAPS_EXCHANGE_REQ);
>
> -       wcn36xx_firmware_set_feat_caps(msg_body.feat_caps, STA_POWERSAVE)=
;
> +       if (wcn->rf_id !=3D RF_IRIS_WCN3610)
> +               wcn36xx_firmware_set_feat_caps(msg_body.feat_caps, STA_PO=
WERSAVE);
>         if (wcn->rf_id =3D=3D RF_IRIS_WCN3680) {
>                 wcn36xx_firmware_set_feat_caps(msg_body.feat_caps, DOT11A=
C);
>                 wcn36xx_firmware_set_feat_caps(msg_body.feat_caps, WLAN_C=
H144);
> diff --git a/drivers/net/wireless/ath/wcn36xx/wcn36xx.h b/drivers/net/wir=
eless/ath/wcn36xx/wcn36xx.h
> index 7ee79593cd..cb409d48f7 100644
> --- a/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
> +++ b/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
> @@ -96,6 +96,7 @@ enum wcn36xx_ampdu_state {
>  #define WCN36XX_MAX_POWER(__wcn) (__wcn->hw->conf.chandef.chan->max_powe=
r)
>
>  #define RF_UNKNOWN     0x0000
> +#define RF_IRIS_WCN3610        0x3610
>  #define RF_IRIS_WCN3620        0x3620
>  #define RF_IRIS_WCN3660        0x3660
>  #define RF_IRIS_WCN3680        0x3680
> --
> 2.53.0
>
