Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FDC72634
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 00:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773101252; cv=none; b=L84nPM7B914p0I8z+/eK90r+SEnMa+hrwsR5jX9fsLbpCmFfv2XBoEd+Sjn0QbTnXvuKew6CXWyX356mG+O/e45n8r5fLjeZ60nX86y2FnU9/RrWcvZgY2mI19ijNdk0XK6X3K4mIseq00bwemYAxqPs+0bSGlU2kqQeHVV7jlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773101252; c=relaxed/simple;
	bh=P58zuoeK3XyttEuYCWkCe3W/ylCjEQK5c9GEr+Rcz90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Klv38Lf7e3BaChWkoktQqncs52gwUt4FAvvB+adrue09kD2dhPZZm5TLqKsd9Ftf2WlqdNKECcStuBu+MJLqh/drbGuCkNKWb3GZ+o3Cyprrfj4+9JrIyuJHV0O1C92Qj+CJVB6q+NjKka3NgaHasF3qMTwnPppd6m2AF75cO04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YBGRUKGK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WjbqNOsO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YBGRUKGK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WjbqNOsO"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBr4U3148251
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 00:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0YVUDtYbGk40peP8Fv0PhsiX
	AN6JtNcjR5HdQiC2+Yw=; b=YBGRUKGKp4X8kuGY4wfe8um+rTtWTGXrWmBCm52/
	YmnC48PB8jAjc2w72djinZqmLw97ldx8NF6Q13KdgcRJ6+HFbkkI4HC3guATJU5R
	A1RxdF/kCMTwlpY2Ax+h5ouzuSE5BO6HwVGwZkrgOCJJtQAmbocjM2dz7QkoVZ/0
	53X8aniUG67zMPK+entrUHtLZcyJbPcCarxm2CdbszkI8t816M7214oDk6ol//qU
	QBqlJweYj/i2PuvKGFhQbSukSHaBK5cVd/siY3kcP67fHvPVPIGWnwohIentLOgB
	0bArccSY3c0DAe/0pC/Wb6tzpXIzsQeVlZfaMitsAKN9ow==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csv5uahr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 00:07:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd77502295so1443167485a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 17:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101249; x=1773706049; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0YVUDtYbGk40peP8Fv0PhsiXAN6JtNcjR5HdQiC2+Yw=;
        b=WjbqNOsOvwHAeR7IlYPUQdC+urszHsmpN+Ch16oknNRmDo6IYnpN4z5S40Ot3t5gFl
         q5+3Y9VSQ818nnF0uHEU350MLPR/1n9Hq+0hkJ9Y5DrWDRa+mvrPJc3S/g421pnq82GY
         w9J6sAfkI+/0VJghgD6nAVXKhu9fY/lATPd79M8xBqAk5tFTMYf5wJS1kaA95jLCCpay
         WpPMKoakFO9/qy8aK11f/xUbZEhnxzEePakAAMMcCgWTu91/ckTwfg+B56SNueADpMZb
         MFw4EtoY+7ty6PiV4ZRVoKjP+XoT8heA+cYEXrQPtrsc1gV4qXVYq/ExXqyzt7FDWHJf
         e25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101249; x=1773706049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0YVUDtYbGk40peP8Fv0PhsiXAN6JtNcjR5HdQiC2+Yw=;
        b=HmaNJqatudyw89IbdKQi/4cgxz55/35A/CPXODdtflTazEFF8f98ta1VhLwAI7VAlr
         /e++Mm4yrdzCxKUOQUDPlzpVctREW6hFbBgikYvR7S5PNsm3G6qveRRZFXPtAXtXv0CL
         NZv3RlqPkXMkxmr6bkodGRaMozvCBx8etK4nzMc81E0QZwNi/CHUy53bStdeEydENHxX
         9F6k+nEu68dOYa6hz2jwdYwlYxXCfj49dnQ+5Bc1s6NNqnGK2o5DpcTuX3/XYQKUH9Xd
         fXTO1ScMM/pZ1//jAzq7FGbe4TDvijvcpnqIPwJl5f0T4lWnL6UA5acK+bpEzUo6l29/
         9R+w==
X-Forwarded-Encrypted: i=1; AJvYcCURVQ6jpBM3NdP+yK6sUrCHIHgcdja+MjIz7TmMPYl9oqh4qy4WhBtOeMr9yR23pRi8rH9dheub2ObJY2HeaKG/@vger.kernel.org
X-Gm-Message-State: AOJu0YyWmCrX2VJBuY5jpU9R3bluQQNPFnisP3P/A4RajxPCn6rqNw/A
	eQJmkDRKddWUg5rkShRD/5xvGdMzTmt9HCobRVn3OwHQ3yMaGCQoYAYdCedD9AYXy6GQhPH7ua0
	gn6p14jV8bttQ2nsGqKmZxTZ0hU/utb4kH+zCx7218j1KHHfJRyQpB8PGnBUXStVMpNOI/Hwq
X-Gm-Gg: ATEYQzz9ef81PhovxdS9WvnRdfpHrSK0ntG3BfcxcpWJYo0plhuyWwypHLXYOb/CQDR
	QgWDy8x+CTLkmsTpzt9Y/eXS2SS0mrDeKNCyk55IE2Cn/Boeq5zDHomAGXsoX2OmqIgZXNDPQq+
	T2a12VV52sm+qJh7cXvcWjeAsCF8kIBmY45BS9mDSidHgCBNsHPeTCV88VeOENt7udEApXjU3J8
	X+M1eB/Z0+ZDNdKzhDFjWrQwi/ozw4dIgEzF6HWFRcCoAXPSmJtylJbtXM6fhrPdbE0KT3TGMXz
	51jwoh11HnjpbYGe4aj3vDB/klhmqElhebPvUHguRy60wtbzmS18GVe2xujthK7te4aUr8Pu8Q2
	KSrkbWtMhyyo920aubiBRRc2GYcxfv2OQWEAGJ+ywD0kiipZLEHPLpj9AwByPJLAqDh8IEiXTLd
	glBC0scCJIiqQaWhhdkObGEZieMcN8ZkxiNaI=
X-Received: by 2002:a05:620a:4495:b0:8b2:7558:409c with SMTP id af79cd13be357-8cd6d433536mr1656407985a.36.1773101249444;
        Mon, 09 Mar 2026 17:07:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4495:b0:8b2:7558:409c with SMTP id af79cd13be357-8cd6d433536mr1656404185a.36.1773101248996;
        Mon, 09 Mar 2026 17:07:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d086159sm2355811e87.66.2026.03.09.17.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:07:27 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:07:26 +0200
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
Subject: Re: [PATCH v1 8/8] samples: qmi: Use the unified QMI service ID
 instead of defining it locally
Message-ID: <b4didhxklg6j3oqjhpjw474j5ces4qgmnyjubgwmozfaoua37x@d63ya2n5bmcg>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-9-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-9-daniel.lezcano@oss.qualcomm.com>
X-Proofpoint-GUID: UT3BL_QRA1Tc72zCgh28IYdm7qvt_a2A
X-Proofpoint-ORIG-GUID: UT3BL_QRA1Tc72zCgh28IYdm7qvt_a2A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfXxjs+hAAXI6LS
 QQonIb9piqmp1uCdEpjjnYVy/lZv/u0zNwx3E2u0xSPFwfT3XnTxdcgT9T7+WZ1AnatQ8WmnKQf
 06ikJmOlHOF7QAsj/O/6vu/DdAi8U6yrEfpnTFfqW4gELivp9kd8YZNGzjhHgCL6F+KEbKwqWl9
 nVVUvF4nwx7BuwH8nv1PvzyKdc82Ibm5YhdW06QUuNz3JCcFrZ1KCI3qdH1u7w0HA7/RZF19bEG
 b3Baudmxraj0QkECAJ6uwPOrQJLFGnbexCsTv+uy2JG4jMJC0Z98P9Mmj3i+rzz8urFseWR3kp3
 7Gf2UwfINyNFvD5l0NPwyIBquAFtnssrY1sRuv1tj7/e6ip6pms3iLQ1RjF9XukceAFfuhrmICI
 iAiau+TNvYSFOrJ/exe0I7wdnJ1kSDnE5zkz05K9SpIDCKVNVNs3UZMzWXiZ85tBwnddInNpRmT
 W+RZuVthezurTCOcdOg==
X-Authority-Analysis: v=2.4 cv=Xr/3+FF9 c=1 sm=1 tr=0 ts=69af60c2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=JDd5jbiArqgbxbPHNCoA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211

On Tue, Mar 10, 2026 at 12:03:37AM +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  samples/qmi/qmi_sample_client.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
