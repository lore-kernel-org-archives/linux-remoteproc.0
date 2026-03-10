Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30BC10E3
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 00:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773101210; cv=none; b=L1gMfOyIzLP17jOyw4AP060nDRzwO4y9UGaQo+8krCLdMcKNLPEGJUZR3V6d3wM/RQRkJ1m6kEsS7HeXICh7cNDHTb0FkqDrd/IZgDQ2TXoELMFgVyE4UEYsCESmjgrgCterBu/ce8HU3IvDmaSbawUU0fqc1SdPNu9z7HsKWgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773101210; c=relaxed/simple;
	bh=EeFpgHgJ4EK0P/FdP0P6/Wa/ChILFm1ALZyRl6FBEdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ggxg0qLHfp8pPCEzZZ4zjmKOYzEJz68oiko4j6NYtKUOGU7XYXeuegLDLQXwdlg9mhHR/9sDrV6kpylx8oFeimvPmosxJ3V8G0Wu7vQR+m6vIavTw//qCQKuETvn4qF8i6vD21OhsJXVKDoUelrPF5bru3UBGc0SfXhmmVa8RHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JapuiHfL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RJV8BRjR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JapuiHfL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RJV8BRjR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBn6b1920907
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 00:06:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VFmhFycj2WExrdRTfkSysTZd
	dOqHarJ5plPefogYPpg=; b=JapuiHfLWZPy7Qf1nLM6DfJ2elKq7wWA9Yz5rN8O
	RpcjqtxbVZQzPTeEaWzhCzJvIQB9NqUTVZPR0OLNID2rxrhJ9m0OKBhLQdtt+uQB
	yuFo+H1vhdnVA9t6TKi/gGnCrozq5gKa6R4+3bReYtOAad9u/0n8Jo8QPHo7xI8D
	cCt/YeY2P7veEZ7jG7qhD9+DzYDBeo0J0H2ZHl7U+XfV0as0rPy10njp4OBO5Vhz
	yGlYbJ/CR7EkMmFIcuI0Ai5YHFdPRfqBxlTo6PghMlnTWcANCodJh/75Qk/GjMov
	kGUR7kIDRhzZa9CTzNtrE8raj+VEE+v7OFR4E0kTo741+Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csxy820hv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 00:06:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd900cd3a7so482804285a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 17:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101208; x=1773706008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VFmhFycj2WExrdRTfkSysTZddOqHarJ5plPefogYPpg=;
        b=RJV8BRjRQrzvtXO+9ZiuKZvWLhgIURVucA9aTWLXXE/X4KA8IKA4x0iNJvWL9Eo+MN
         H2vMK8BtNG7+oHHp28sHo4l9d6sOZ5NePQvFD9fXFcuv4ILA7EAuQjH0oF/kVL34fiwF
         TDQxBu4pg9IslEVHI4OhLItpAfHchyFXnAkFNxh5uZ/Kg7lpBDdSskM0ILJ53an6IP2d
         bfyvxl1o7FfZBJMc0R1GS/ScESfLeFLszs1RkPcnj3bX+YyXrxY+Imj62ImTTffuygfi
         8MXMMPqCiCMgGrHaUJHeMB+x9TNT+2FRuGsDm67UZLIbmOLuVUWJtxgLCYHvJG8ueUvR
         wh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101208; x=1773706008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFmhFycj2WExrdRTfkSysTZddOqHarJ5plPefogYPpg=;
        b=dKGX7fwVTgdBYGZaQdjO5S0tCV/bS43iWWX4C62gA47v4+NRGvXNyLOrRGBqCq3B6/
         Dlo7BxyMQCF8wIzT3jlluNXtXqSO4zCSJ93UsykUL3ZTax3jgU5lk7kNVzCZDqK23KQj
         uYiX89yH07qmhbwvxGhjahF4Xv/kw2wnq9XFKkxHoJrH/3KSIUFTtrlaXqw+DYNieuiW
         qmNJN4ULHM3RIx3Rj0HyKfzfyUUa+EUx4fiMX8aCec66oWpVvSb5qnBPRw/88g71/kgL
         LSa56qNSRzTiDAX2hkVxsc9T9Ij3Ds+/zcISmRbzUQRflzTs5buX1GuqwIl/+nm3XoOB
         Klxg==
X-Forwarded-Encrypted: i=1; AJvYcCWIz0HQga3Mlq99LoeOMtAefeTZONEfj1tEuXc/QhrBGyD8rfaZi6pmvIe6t62+KChgeyBdIh33YTnkzJsP3C1t@vger.kernel.org
X-Gm-Message-State: AOJu0YznT9NqSu2cME14LnVsg9G7Ys1xX6E7eEHCbAR4NhQWR4keT1x+
	eqtgWFf3vPvciHYxxETOPi0bLpylUPsfDhXK0fUt7MUSjqkxCaIXE/ftfbjRAcZjWvIF1lW/aiU
	33wGGLqF108XnzIh1Kg2PKLghHKVNSMdYBt/5aeNcF2R3ihEyQyfvSRS7ZkyIDLNs6kqsQ7ll
X-Gm-Gg: ATEYQzyY81gyESP47eR1tm+EhgiEcxM5PzEH4kJM3qig4N89gYjlVQDm36vj7s2Y1Vo
	MICB3sqRELQSyR+KkXCZJ0azw/xC56dMlPt7pHAuGKHeJKMlD5bJKfkax+hp8hh3Xykl9NhvxIp
	gbS9O4L4gb4k7Qd6o4C38FZf41Hi2HluKdx0PvMFhghbtvGTgKhoC3lQyVq2s/6ux6kDn2zt+Uo
	nljR0gYHItO2zdUvxYpCdjdgRm+sNU8PSxEVEeKAetf5ksa9E+zOHo0gc1q/zkm4WyoIreKtney
	BPWfu/cSjAla4lLBvW1cJ6WSLfeuIR7Mg1mdmfoPv/RpIV4gtHPlIgVUNtANcMALBy24sshXSK6
	qvx3Y1CBMxwfsEQH6afJZvHokOjrcSQJKR7kgl4/AU9zzYQIRWkmhDNThgflq+iGE/sgX0yOUQi
	BR1kcHNMHHGRT1cpvcR40TN0rJ85R/rbGCfRc=
X-Received: by 2002:a05:620a:46a6:b0:8c6:c9a2:504d with SMTP id af79cd13be357-8cd6d488044mr1675003485a.59.1773101208111;
        Mon, 09 Mar 2026 17:06:48 -0700 (PDT)
X-Received: by 2002:a05:620a:46a6:b0:8c6:c9a2:504d with SMTP id af79cd13be357-8cd6d488044mr1674998085a.59.1773101207669;
        Mon, 09 Mar 2026 17:06:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08641esm2376849e87.74.2026.03.09.17.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:06:45 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:06:44 +0200
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
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 6/8] soc: qcom: pdr: Use the unified QMI service ID
 instead of defining it locally
Message-ID: <sm2yj2zmhswp6ydjeonal2upnm6qwokivmrnyajmw42iw2zeyu@d7kwprkm7voi>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-7-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-7-daniel.lezcano@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SvmdKfO0 c=1 sm=1 tr=0 ts=69af6099 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=1EgtvGsZK5M7WpkkhHwA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: L0FA4w2VtKwEZcpjnQl4xKWQmgIdtv93
X-Proofpoint-ORIG-GUID: L0FA4w2VtKwEZcpjnQl4xKWQmgIdtv93
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX8iOSfJvo2M0i
 iy04yx5qeh2FEriroWqP3mx13+YVJThLjPW+jKUdO0T2FjV6zf45sN4eQs0H2uU1/DjrZnlzIEe
 Idj4/QoM7iKXMgR89VS0OoDbVDJ1OfEaFTYen8CtOzq6UPnbUXCH6ahlsUF2mQKNQNbyDjT05yQ
 HNOGlDgNGuDjB2tDMXcMpGHL9Ch2kZoKv4tXaWPjJvhIgHecWbnnM1xe9wraMJ3xC2LMi+7P7An
 7fdoq6he/t3a8KNy/JilopwO7wdoA24D5Z6qM00fc8Kic730qdj8cWrvKC6vX3Ymv3UwmBii5/3
 lim50oKZffrBdOV7EBhH+LV+T1vPCF4zuDTnKMew82M3ONAL2FS+O3GBA47IaAXvGGUP+tjHdP7
 C/QmlvFj2v7dGQlI2lC9s1WIEpjMRSatwKj3XIfBwiDCxn64qB/KRX52ucJfFx+n5GRGtPvf7oZ
 rW97msmYdx7GstycmPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211

On Tue, Mar 10, 2026 at 12:03:35AM +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/pdr_interface.c  | 4 ++--
>  drivers/soc/qcom/pdr_internal.h   | 3 ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 2 +-
>  3 files changed, 3 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
