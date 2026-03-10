Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8139B38DF9
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 00:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773101200; cv=none; b=K79r72CHuwFxd1TZavQ501UorfJJAQLAIklnnggNIdaHeHzFtuBhxS89X9VuebmgZXTqRAHEiSmthLGXOqG0zIOFde3rI7i5Fa/kpOkgzbGckvBcArUA2JTJouptD19gifGhWw6gue7zZVHgAdy+L2aSXc+p9FgP21MjdVAfeA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773101200; c=relaxed/simple;
	bh=tUmt6OxyYKm3dZ2u6t/zmku4MTRZYJky3GUiLcfgz/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BcCndDXPUyN1WoBk0roskaBrho/xtJ1CMhO1+gnEcnUzAN9UstPfOtuhr0mXcabkyBHk3uhKM+3TZwN4L92ocwysbupehyy55nj4n2X4c7vDVolQvZTyYHMWfhgccK0nmlI/5gY+QBjSffTlHmMoPQqqQCyKX1ak7A1P48y+0V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RH3i+5Hm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lz7hMBhX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RH3i+5Hm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lz7hMBhX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629Nojih4131083
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 00:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Hhzas3m6jtpCWQCVIcrAsr4W
	EI6JkmKF0k2Y62ZMW8M=; b=RH3i+5HmDrcWtIsbYsGLYPAucQJ49p5jSFCP1XK8
	cmD1TTszcORCF20BgNAuXaMv/jJiLRErS8OSN8QmqlCTHyPy1z+QkEdtxohyjYG7
	A2mADZnPK9mA9JpXvpYpZGSIN7dK+BD6vZgH+2IvNkfpcXulgdym5sqCTauzjtkf
	vtuiyUTc65s3tMmjbV0vaKA2UBoopnEDP+Wh4kABNLM7l2sm0CNYv97yvtbjRe+8
	S+oMT8HwInm2qtDIf1ZRhXBmNqquWgIRW4C+P3hXW2N0zjD2euQ9JQXbhB2aEC63
	TEvjc5oqXJ7b/UHtcEB1uZLhcWij+XqY/Bv4WDu7ADTmvA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct88001ed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 00:06:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7c4ab845so979122685a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 17:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101197; x=1773705997; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hhzas3m6jtpCWQCVIcrAsr4WEI6JkmKF0k2Y62ZMW8M=;
        b=Lz7hMBhXTcTAhut+tWMjq23JjIGrRVAj6Rwy/noN8p1xxb7jhb5SwVyDGw9z+3Hp59
         3X3LwkcAUVL9UAizuXmoJKhB3+TKeFFJHOOS9SqpJjVQ0YSOA/XjHtwSHxruxuKthPJL
         AoTDbyQh9UyVfUeUcO8c2tpLMxp8K5vD2uzDYWSyISP4bNZTE30q/N0CD1TRg16Ugc3H
         rYzjTxphR2PiThhK1SXaMD81PXGZQXkN/dGf6tkQh7KO0KExg2nlAEbNzHlKNN+6/BFI
         ++7CdmSnmAeFUYh6OybHOmJaUPaBn03nGQwRBYR6HXKqI1okFEz3VTkVsTSjRJHqv3Zd
         dz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101197; x=1773705997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hhzas3m6jtpCWQCVIcrAsr4WEI6JkmKF0k2Y62ZMW8M=;
        b=WK6CCSfAiiJFtVR9BM4b3OhaG8ndzld9bN2sDsssBFbJ95aVrsaBZNilj3OUSLpdDD
         lJ5FWezB0o9cOoATK70ni/0Ep2gn2RX9yZ1PEjbW+5xPaLncnmnTwYMM2NXZOMi+V6aR
         LxtO8C6Buhne8HuoCYDKfX6trxUHeUZoU+Hb7C9hKK9ZgSnsyHuXZtylzcg4ulOtCJTf
         gPduAn9MlOj4LSDs0vT8HA43BRgJr/Y8SjVZz0U3q4QJkc13pBL27I/IlOr73XgwMqeB
         WAksSwtOo1rToyUeNdb5b5FnYeEsAGj8LfXzJZKk6MAmCPlK/g7mD2Bzn6YsrwIF1G26
         hIOw==
X-Forwarded-Encrypted: i=1; AJvYcCVLGmqzKhAXfP6KAGkb8uqyD1RR2FWBzYNuAijfoQWB14QF8ZTyRTBc+2JA5ZOQ7X5btRKE86j0IBtjyRrpogV1@vger.kernel.org
X-Gm-Message-State: AOJu0YyDip3B3a9nympT/Ua3solVIMT0iZ1GdSyvosw3JD4dfvsGKdks
	H9yl6D+KDqpUgfRGsSZLOG9zvlPuaYpFSHd2B9Dl+0zGNlXdmXR0eA/nEtGluZjjVCO1wo/k9M+
	bTl9mkn7oaxTu+Z2GCM/sVBHjwlxTRcgqMglvkyOv+iejMrGvChwMxR6Rm24UIlYmEbnJYTGK
X-Gm-Gg: ATEYQzxEpTm74thvLt4Ad9dCRKZmz6jB7igRUlTAGTe4uA2M40ayKkeTbWwpMSKmT85
	CxnwET/ATHL4cuwGBSojtzSit+HUfTMX898T0ndHqi2kI4iENX5psEjdHdVyM9v+vNKY0/Icg31
	DGUAvI/u7EnGxN/lOoscRYqY6oUnMzTZ/8QR1fnZpaj6u0IyVSIwEIlkaAknvG3hibU9TRxXDKi
	db9cipDWUnn78FsAlTUUgnEKsXGDry++EwwEQfzOYLCncFPI/H68MOfcQs/0dulM0qctoF1raMX
	ZSrzKfGWddnsU/MdrF5rY/loOPvUw7Qd6+YJhngIbYgZYQ7aRb3gtlCzR5KL30DRmRWA6ANCcLj
	Cf2Jq5SnCMi34Tdv21bspAg/xk8BI8nkArDWoEYVkv4lMih/ORrGWkua8YQHwz6YluQGW0pyH9k
	JerTcdMCWt3cAALFvU7kL9etCE81jaixQPuQY=
X-Received: by 2002:a05:620a:25cb:b0:8c5:2f36:660f with SMTP id af79cd13be357-8cd6d4afe58mr1491595785a.78.1773101196813;
        Mon, 09 Mar 2026 17:06:36 -0700 (PDT)
X-Received: by 2002:a05:620a:25cb:b0:8c5:2f36:660f with SMTP id af79cd13be357-8cd6d4afe58mr1491592585a.78.1773101196256;
        Mon, 09 Mar 2026 17:06:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08d269sm2464700e87.84.2026.03.09.17.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:06:34 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:06:33 +0200
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
Subject: Re: [PATCH v1 5/8] slimbus: qcom-ngd-ctrl: Use the unified QMI
 service ID instead of defining it locally
Message-ID: <6dvg5nev7sbqyfhmzgw3oln7hb4b4jlw2yhrskrcibdscoziox@hir4jpjcrzey>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-6-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-6-daniel.lezcano@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX9d6rqzFbcwas
 0beBN8TSHxb/xe65LSQ48h9c9rITwlV4ezyt2vktdtzmkjTctHlXUE7WJp3y9ocCozevzrJo5xw
 wvmMe1Jyc7u7Px5K1JFthNspMS4A1JVdy9ksgXREdGDlMessPRoAPRPz8UnFQlyt00ibu1C9Wju
 B3cuKne2dF808tojIYk4DiTnD+biJ0fyqkTmrvSqb+YROuAIY6rultcIKfFM5FTTFAxpPqMX6EY
 bEmvkZlfckj7cD6DOeOklMGDQ7JvFPpDlx9rdQdFRvu7xiyS1GolMA5GVgL4RflHlRl9aRl3Mlu
 EVF6zlGurNZqcRiMMsuUjvGlsTd2f/JPTLyKvfCWkVFcNDyUmNGY6Mp6UhDle/M+za0RoeAsPqE
 /g6c9WdSE7JWSYWmLemBp/vBalEOHmNIlGI1nT35/QvtLCXYNraHXEVf/lB8yAdZRuTrMJHZL3n
 7HCUInGBHLqfkICbo8g==
X-Proofpoint-GUID: uYCh1RpOQalc8aHFCZK8gg_bVVU4VZdz
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=69af608d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ho3SWJPnPTLIVTUpvTwA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: uYCh1RpOQalc8aHFCZK8gg_bVVU4VZdz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211

On Tue, Mar 10, 2026 at 12:03:34AM +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
