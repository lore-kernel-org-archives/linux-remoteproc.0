Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A1C3A8F7
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 00:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773101238; cv=none; b=Ea9GB4magMbLBgdBMbrt7S6erjCxVH61EbCzX31BbFsqlnHMnGuH17cnZ9iFgg4VU3jhCKSwft5gcCFMI3hqrc4Bxte+G18kXvVCwrSwLGubZBGzSA/02AYMM1xRmDRqnpTG2uKOkeIrymcCAwiwmGybCh8na0d4gehVRtWfCJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773101238; c=relaxed/simple;
	bh=3F2v7hgwZr3ASkPIOrKgTyGTogdHVehCHM7L3OoGrn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=teglAe9Wz41qnJnFsfdyqZ26Hdk2s/ECfo0FU5ZGKE94OoKzbiUim3q+Yw7RxrrRQ5mrNLivHI569XX+9v84htMZrhrDMfBTZbb4rlsJqhXBXlEmzt9ajlC3QJ3aWgtB2E4ctz3PF9pg7JYqb4YF3E0LBsClhhfbWH56q0QYRCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Omrl9Z5y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ikKJxlPl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Omrl9Z5y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ikKJxlPl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBkL7859602
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 00:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wz0pGWQvcqBNbODzMfkbDFxp
	ojP6Pl8+dAJsLfprVW8=; b=Omrl9Z5y0ASn3p9OZgFd6Um46iUkDyJfKRJLJrlp
	SUxeV6VpjDLDoud8YjQWNEYro+I8Xya2uzDaAoWxRN3cVSUA+BIXWS2n1oPkJi1+
	eIfJX9nm8r+pNyAGPiW0UFyJD2JTLrAZBvRf35OwlA3NhKJoWoDjuUIA3SLLVV/D
	/YvZDmTfm3KgU3ATSPv736RNw2onpNNqv6Kd3vgbjBEkTlt0SgvPJxQvplqq98wD
	Vl0srS7Ut0qzYbPHAMnKGwUQzyvBrwizfdX/Ov/7i3BABT3kTETBfpg0xWJc7qFb
	DOzqKzQjwLhABBbAF5xt/X4TrIkDbf/zf/UNCBB8X0w49Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyhbst4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 00:07:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7ea0bb20so1160097985a.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 17:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101235; x=1773706035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wz0pGWQvcqBNbODzMfkbDFxpojP6Pl8+dAJsLfprVW8=;
        b=ikKJxlPlrhtPKkQmSTCiYYjq0xOyBOouL2ZzliW2aCeWJhWk/k8upUnw3TpLUb0B7g
         LajC9SNU1fjZL/GIwH87xulYTddmVCpvp1ulhX95sJnVakZk/xRUFHQG4mOwuFF49T6+
         waTGMd+/i005kzKSgX+7gCzG7NaChxA7J4YA6HU9qd2jZU2UQvq2TTOkhAVmDMAhp3gO
         R8f1VaqN/CFegrjbK1Nc34saQQ/UzqmaVDrJn8JhJ6apY6QATYpjw5eIAGnHJhdlCjDe
         xQ+faJp+/QjcjBZkyw1bOTh+vZszjw07laS8jlC9jx91E7cIeb/YsA7vhvkSqgPrSPXQ
         ys6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101235; x=1773706035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wz0pGWQvcqBNbODzMfkbDFxpojP6Pl8+dAJsLfprVW8=;
        b=Z105G4A1XV2PxpUxBGQgBCPko5DCd0P52foU2pavYAE6aSgInrdrtgCmc2DnDEbXG+
         AwuvAGkttUCA/TQNwRZVN2opc/LKDZx/U6TWV8eXbcQa+6W0mPPgcbCM5xFZu7C+Y+ze
         OqcrfUtZj3KlsLwtjHE3eYK36pFD4HUkL27CwhE5wbZy9AmcIu4t9T3RGVvlXUkBu4yu
         CVXPJdTIQDgRKOzsSaCY69T+Qflzu62oPm/VtHE4+6IgalRTzu/GCh0VnzbPKcz5M4b1
         3Cuf3J5cyM91NMKq9Klxg+cx+qjLjxgAIqdsmC1yvSo8m2mCfoQNPudV2K0ujeEUpNiG
         4VKg==
X-Forwarded-Encrypted: i=1; AJvYcCWGa5iMsGW0wsXHLEr9oLIUIvLypz2SfagL0IdAr9tkOLQkuC+R/9mha5qFka1WNpd0Id8W4jb/yk55aEZzPQqH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8wzvdfiauWKAkApsR1yuHZmwqwG5O3aEHzRvjIgQ/E5q4g3v4
	z/iZm2+pJBzETjCaltjVoCIM781KzldK6mXfvSHotBWQ6Q+BCDmT3Ws6GV/Hf+F7H5cyQNiqb0T
	eTabACBJDXvCE+FqIGDfmw3kV+yr6nLvEZU4P+aEH3t/e6A9jercjvTnmohD2IqhEAP3XT9F8
X-Gm-Gg: ATEYQzzGfDzIhvTQ3+r13aqRCvgSGuId2AasNUnT+4pMfnHyQtomMgd0RBo7y1VYKqk
	jHtV0WFvrNVvQ+b4BjgUUdwU7KluI5uWQBD+SgAdm17ZgHgA+uy2v6LFzc9ourHVkFtx6rVmsvV
	Jeq+5D4hO5HO5kO/7hhA6J8Smx+lLVQfETeXCEAhiHkMOi2JjPPRw2eMAxUGouCD5nHOBjgYMaW
	F8dcXZ6Zp2+zEQLlwLPcrZMktHkGcpfX50B44t7A4PA0SF7l8pfqslV8uEdkwdSHHDbZQxg6C4b
	AOgCxNLwxOqjYOWNKD9YvO+UwNWsEOh6Shbw/ibcz9mdcbpwPrS0L/poKDU43O6rhM0M042dk3T
	MaCocbl16EE+bKbHybsHN/ZYA2EPd77b58RY3Gj9HsLQDu5hoL8rVJAWKD2DjwpPxcvdGmA/SJQ
	1lLI7L8ppEf8K5RAnTqLYbFHmg9o53lHzu/7Y=
X-Received: by 2002:a05:620a:3185:b0:8cd:8f94:259b with SMTP id af79cd13be357-8cd8f942ea4mr384673185a.33.1773101235207;
        Mon, 09 Mar 2026 17:07:15 -0700 (PDT)
X-Received: by 2002:a05:620a:3185:b0:8cd:8f94:259b with SMTP id af79cd13be357-8cd8f942ea4mr384669785a.33.1773101234727;
        Mon, 09 Mar 2026 17:07:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5cfa1459sm1844501fa.1.2026.03.09.17.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:07:12 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:07:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org, Erick Karanja <karanja99erick@gmail.com>
Subject: Re: [PATCH v1 7/8] ALSA: usb-audio: qcom: Use the unified QMI
 service ID instead of defining it locally
Message-ID: <ljv2kfghtbnghu4ihfskli7zhiwme2owzvtuwckbbtkcmhuyel@pa2cmlpz73th>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-8-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-8-daniel.lezcano@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Rcmdyltv c=1 sm=1 tr=0 ts=69af60b3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=R1rXswN30TRtGkWU7PEA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX4dfpWc5mYXGI
 qx+NQVhtLnQ+18dIURWiGLKRYVUb3mpPb5Jt5oAsjXhy7MWdKVbYxkmtxO221Edvvw2/ID/91Zt
 ZgscfNaTY6JZvJiiU04fNUiUFhbal6At4BLjfYYlQ+k4HqjuxozVx1Vp9OBKtJfqNyKneRd7JfB
 uDejwTsv+wfnnrpqzESC+YlQfNuoqmzYYeMAu96x4G2CoH5mQFUKmVZtqSsVit2HREm1bTkLLrT
 +AWIwJxncFPSvlyEz0/eTF+Uu+tfgqItJ/t4c4wqikx/bg85hTWlZpasfeBt+4IAR6D32NaCr3t
 UV/0lKxJlrnrKHuVAeQrg3dmPC5MAZGZBFEDZtU8r/zQ1PklBtp+Y8n/PJJGI8mbsP7m6ubjc0/
 Bilux0vhaOhNe5UcXG+4nv0SLa3G5/IVjjsOO5yhFVS0tuXTyJvRRIfvis1ZqUNip2BYtMqr7nS
 rAZjZWmUTLIHHGM8eyQ==
X-Proofpoint-GUID: DddpATM08Y4FOJpA8fKUSNRIUwm3R3Nu
X-Proofpoint-ORIG-GUID: DddpATM08Y4FOJpA8fKUSNRIUwm3R3Nu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211

On Tue, Mar 10, 2026 at 12:03:36AM +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  sound/usb/qcom/qc_audio_offload.c  | 2 +-
>  sound/usb/qcom/usb_audio_qmi_v01.h | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
