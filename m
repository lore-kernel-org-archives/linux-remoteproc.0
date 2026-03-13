Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DF91A683F
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 19:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773430070; cv=none; b=XD7yN6FcPoIDhIpxQaKUWA8Gaztf1dssR/znM/85ZWJLiRbtZXisg9P7C35MODIJ7O5Mi/dEBdtus5XgQzc5VWZizOC/88dCiPIKI0QiknHFRp4tdFhaH7se7FqchC+k/9JCB1J64ZtkgR7Mj0H7OeQt9khds5RYlQHQRlO2tYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773430070; c=relaxed/simple;
	bh=rKz6zJlCR7ITF7m2iyI0w+PyLtJ5s+0Gd/J2y9arA+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j39pNz42xmCdmAj/5adN64SNQQoW27tudM1gJ865J6oBOdupD3d1bCYOG2KTOEIwBAFTwY4u3+vL+VEA3VLorjWGjOnLZqkSyFdAthddSw9LMH0jYCzHAvMrmWKBzW6aOGeOmDZ4lkM4n0sbbcQ18XpLuk9M5Al4Y7Jd2Ur1r28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vq8XhnZp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hDNSsipM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vq8XhnZp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hDNSsipM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DFXGJB437734
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 19:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qtj/UJdhKICdBz0n8e3V90EO
	SN2LnU2hBaq2dvS9HzQ=; b=Vq8XhnZpMXKdAHtVII0VRF42/U7t960S2JjaTdsD
	1fuSwNpQSpSbxbNqBqwZKntiSvOcWPVusf02K+BF2mohlIdyowKn8NJuA1yU5TML
	zY8yONJLJE88+eog2KyvqntOLRqd3D0skersybpNkfDWpXQ8FBX2uki+rm6WaZWC
	JS6EN3E77TgF+GJjW+zlrjDkR7jBy3YOxuyYgtn3aFi+EIiuBSYXdnpbwaOZU2L6
	hAdRsFRp/ODK/Vn00F4R55dlSDEtK/WBV5HBNWD0Jqo3BiBbE7fG2bayZhatSaQr
	ty70Ze554sUP4km/oXEnzdALhsMZgHtw9hpfotTMS/jqEg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvnax8st1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 19:27:47 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94ea5c0985fso3595785241.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 12:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773430067; x=1774034867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qtj/UJdhKICdBz0n8e3V90EOSN2LnU2hBaq2dvS9HzQ=;
        b=hDNSsipMQ7HgnLHA14lDlj9ag12/czGUb+Yr0nRzlESpfQxi4qyb0spSd7sMP2swl7
         MSQwMV/V01ZlM1WviYt1SoMbbp0LrxtryBSPzrMWHuV6xmXa3x6UCmnSZMPTqXxPdqi5
         riBqcCI/v9qm4n5KOZq+RzMdcScNS/t6ZmPFzSP6Qy3CfaCNyr4UhZ8JtVUjWJDKrZ/I
         hIxgfcsbqXTjIT6A8O8nvFTTI+gR0kNOao3wAhcHjsvl5ULOx5xYF7nKN9Rfq8DeFD3m
         Ji5wpQk/tgqnsY/gfPCLMJH7SkGgLjWuJ8wnMsbwBDiq62OAFMJmGn4tHdZ7B/yj6ozk
         KqyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773430067; x=1774034867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qtj/UJdhKICdBz0n8e3V90EOSN2LnU2hBaq2dvS9HzQ=;
        b=i6qHEAXiseCiwBZkxGtGP9S1lSQ9R9j+1nsZzuKmrmAei8fo/AGWaRih6Vkzw/Rj2P
         4mqia53X3KDpsUy6Jed4S02JuQUidOV+N1EPg1O2d7NwEQWq/qukEJlfxscJS1yeIGPb
         jVRzKIskbOany0BEsRU79YbnO3jck4fKWKVJ6o9GQHjW6m+vy5F+Pcl7Oq30XaI8ehrB
         XYeADDPXl7ybUD5+xAFl5n07Pgp3wI7lf5ggocvzUeBH5fGgYfw98N6m4E8RwOsghf2H
         vC45Gy9NV3hMm3MnFRYlsoVz0/507/DriN8vOwdiHCToNtqk7+lo3LBylrd0/8pHgg7M
         fbOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIcXGBHyFsGl3vgK9Rq3gz5v6uIj1Dmn6qHqp//VylExge2xwobGYVSwiwUbTpAE07J1/pZAP/4U5QATiWEZU3@vger.kernel.org
X-Gm-Message-State: AOJu0YyMgiekaDKR+wuoWYcMc4r1GL0I6N62F0FeimAVi7414hrqGQQO
	ikjTNgfTTrchKXLjE7yg3HyxC/Jehs5UboAQy4pghXJ8W5DZgNpEIuv2goGuM6Wizgr+UyrrWEP
	oVKUNS3Ye0JbwrwgKwVd+aTh3pb8vIuEruuiWUUGf/loIG2Zdg3eCSQIJIsvCvn9ZS18wixyE
X-Gm-Gg: ATEYQzxE8FpnaKsY1XW/ckmaqu4gIMtfbGAfeKeouhwpvyXAKX3X+1+YexaAxhJWBUL
	wKLRS/fYCJi09Ws4dn8AXKIwIKN7jCYVRlY6LvkzPWKwhG2PiWlUymY4G/OgMrt3WGJoPCDtXrN
	bGgbdudF2MiZSA1e67bwiwLPaZpnmpA6+E3KaEJoWZaIckrckqKXjPCwECQDzaRqiesDLMaobVL
	PgJZV/+TJkdvnkTU8Yq2tmzc1zI80JQvUMAWbBssXEaqzEtAQ6sS8CILtWFQUyp47Jn9xoDB166
	KTJLAOXCtOYp8f0Opr05BDP5AnQiAOpgRzX4SkIfoPa/2AAl/qJSKNwhl2BX4AQOdRbyKMkk1vD
	t0w9/nfZuEu3OnmHqTKovRoiAfxhTF+P/pQQzQD4Essbtr0ny7CGu6FZrtHBal5qmwzhdz2sHil
	FeEDlOeN/5L0Eyq2rVCVXMIdBGCnFM8+alQhw=
X-Received: by 2002:a05:6102:304d:b0:5df:8f4:61e6 with SMTP id ada2fe7eead31-6020e59d4f6mr1853574137.32.1773430066952;
        Fri, 13 Mar 2026 12:27:46 -0700 (PDT)
X-Received: by 2002:a05:6102:304d:b0:5df:8f4:61e6 with SMTP id ada2fe7eead31-6020e59d4f6mr1853552137.32.1773430066362;
        Fri, 13 Mar 2026 12:27:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67db290esm16299201fa.17.2026.03.13.12.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 12:27:45 -0700 (PDT)
Date: Fri, 13 Mar 2026 21:27:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kerigan Creighton <kerigancreighton@gmail.com>,
        linux-wireless@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        wcn36xx@lists.infradead.org, andersson@kernel.org,
        mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] remoteproc: qcom_wcnss_iris: add support for
 WCN3610
Message-ID: <2pyi6yavgbf47amofaw44znotleankmmou2u7vzx2v2xc4hpye@6f4fcdk3hebn>
References: <20260305003253.1022386-1-kerigancreighton@gmail.com>
 <20260305003253.1022386-3-kerigancreighton@gmail.com>
 <20260305-crouching-sceptical-spoonbill-fe75fb@quoll>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-crouching-sceptical-spoonbill-fe75fb@quoll>
X-Proofpoint-GUID: Re6JwekoMKLdtR22uUuUDyPw-mPahylN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDE1NSBTYWx0ZWRfX2OeBG1Lms8cQ
 d76B122PYDaFUAjmweMYGywU9S1zTzSF9GQ9A3eQtERlXhmYZhATMP5nNKoHvmeIvgRYTPDwvwG
 pOhIKFbuDFh+q/+NOpxTuwVENeuDTIdPhE5CpVBVBqwSQtQEFS7C5m+4z3jUSEV1W7ku300gCIg
 TShZf+SQko0Yth1zpWxGXrc0O80S8aN+aEYNH56+pdCfJPDHgzGQS02sdWOOQopiGSc1Bvsu9YJ
 GGQAIpUObB6I6t5v0NnvjccIWkXGqgfIUzRlRYCT/T689MxzwG2V/6PJeFgKOuC9de1/JiIsfP9
 P3M6QpiS4h2jVV6PnJV+a34U6Z1Yi5aKC2JroGcVTauCRheB2hxB/fflNmXXhDTrHRM6fFrfue3
 KyrfxAIgFZ7iWj/o+hf6ivqJuNMQMiMnwW7i1jDR3JNsz7t/0hcr7VcguFzkayfsAGEpEfVb0OM
 8ZL42Uq9lwluP4PrAgg==
X-Authority-Analysis: v=2.4 cv=X5Ff6WTe c=1 sm=1 tr=0 ts=69b46533 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=D8mGTEjQazq80tWk8dIA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: Re6JwekoMKLdtR22uUuUDyPw-mPahylN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130155

On Thu, Mar 05, 2026 at 09:06:30AM +0100, Krzysztof Kozlowski wrote:
> On Wed, Mar 04, 2026 at 06:32:52PM -0600, Kerigan Creighton wrote:
> > Add a qcom,wcn3610 compatible string.
> > The WCN3610 shares the same register configuration as the
> > WCN3620, so its configuration is being reused.
> > 
> > Signed-off-by: Kerigan Creighton <kerigancreighton@gmail.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > Changes in v2:
> >  - Move remoteproc compatible string addition to the middle of 
> >    the patch set.
> >  - Add Reviewed-by Dmitry (thanks!)
> > ---
> >  drivers/remoteproc/qcom_wcnss_iris.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/remoteproc/qcom_wcnss_iris.c b/drivers/remoteproc/qcom_wcnss_iris.c
> > index 2b89b4db6c..e58b59355f 100644
> > --- a/drivers/remoteproc/qcom_wcnss_iris.c
> > +++ b/drivers/remoteproc/qcom_wcnss_iris.c
> > @@ -95,6 +95,7 @@ void qcom_iris_disable(struct qcom_iris *iris)
> >  }
> >  
> >  static const struct of_device_id iris_of_match[] = {
> > +	{ .compatible = "qcom,wcn3610", .data = &wcn3620_data },
> 
> So compatible with wcn3620? Why are you adding it in such case? Drop the
> change and express compatibility or explain lack of it in the bindings
> patch.

I'd say, keep the compatible. It's used in the next patch. But yes, it
might need some epxlanation.

> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry
