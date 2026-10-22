Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792668768;
	b=s9E5mW8tAX6AUnBBojnsCPDgmqcTdVbuodre5hXG2qYO59/x4dQma7iF5V3It3uVYDQd
	 JPx756i8/V1RMS409AQT2iC9sNPa4UTp0xJJ9h4w2HPKqRmR/olbrWwL14Qh1lL518cv9
	 /sT5oI69bx2RUPXGu3nyJRXi22CqUhJceC69XTNN42gSGJM3nRnGP25J04889TtPTQqck
	 ceUaY2sHXvglKtUe3gghkXrCAoepUZEB6pGBO61YG8pUH9hufjZn0jY+/v8Kf9spajIbb
	 ErWpqmhJhbh7Ml87GViMJoGIutrgbQWdECeTX2xFbHZCWmw6b4hIAj9kIUHnX3NBgtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792668768;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dXEU4fNstySwei7nZv6T8mycxD11pRJ5qnWjwSzk+X8=;
	b=lw1p7FTHujawL6ZawKqsjMMZoCNAJT/3yHzxRuS3bwRuUd1+YvxGx0vfhFybsoDT7cIX
	 j+nmL/uWuLzvtpwW2a/H4ylqU6K4f4SJZUH6hEIX1b+UfrtykKYM6OgE8Ld84+98DsSgA
	 zkBsNQ/tygQCu9H6xz6bZZA23RR4whMIiKeQzZHYk/deom0UksBO7TfmYWTHW4u/dP7b1
	 O+wvtX77pPXBsLuTy3E/OvbYiHlxHioEuyDNvNUGKnWTTPFp+kleIKEpq1FOwG1qdKgtl
	 pSJ4jv2Hrj5Y5LDLgaZcor8GJsgyzIADXQ9clwuBAH8IEAJG7Ad+4ibWTsKlBUnNTaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z3TQBkVB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QYG1Xf6G;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434E3606A321
	for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2026 11:32:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 434E3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z3TQBkVB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QYG1Xf6G
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA00Ps346213
	for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2026 11:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dXEU4fNstySwei7nZv6T8myc
	xD11pRJ5qnWjwSzk+X8=; b=Z3TQBkVB20a5qG7u5iAzniVCA6vhy+g7rZAljzZj
	mkKDSbpW1JcJKAAZtfFabQV0ZGI7TqWZlqo3AXsayy42gSw7v6g+1gGBw7SjWB+n
	pI/1Oy7K2n9v5746SuqfhYWkIf2AoXKZx7NWoRzDGazf/PJ7zSDG0r8ITgSTVaWD
	X++JFG2o/fpng6QQASI9c5gvT9cyqvFpKlyEjkkUfw+3nMc2lmsStQqjA6rWtVn9
	7IAK52MAkALuckgcBtHxE8bPGBRQdIx6RxR4jgkbaZVBXDtVSD8N2PbN3uacqza8
	ACWxeRJbyW2J468G8zRfklcoM2HtzT0dNPxERQanw7SKTA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93daptk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2026 11:32:42 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-169846a19aaso720642c88.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2026 04:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792668762; x=1793273562; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dXEU4fNstySwei7nZv6T8mycxD11pRJ5qnWjwSzk+X8=;
        b=QYG1Xf6GP63YYCcSETYUUVRYcrLd+SXv8cR6aRb3KCYkvWyZ9y6XMP6DHnmOYLGNGF
         TFDzwUE34a3SyTiYrJJ//r5FIrAAFFvPREKaSzsNRZxYLRcU/5QAyhJXc4F7R5raz1Nb
         M1I7A1erKhkQkJMLXwpri4/femNNkvaNhyGmNivHbhl5J5IiVIedzLHVdGKcI2KSUk8K
         1Ufe2W+v38JrzYqUCuIuk+xdoUJX6T1/JFwB989aRfJVpfYKKJy3yUriQXhxiUPWe85h
         pn4hHnPjyqYsUOrIhK70lm0zx5BzDqmqhO/+RhImbgfD25K7nhNcCcyEX1sfM47jkimQ
         uYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792668762; x=1793273562;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dXEU4fNstySwei7nZv6T8mycxD11pRJ5qnWjwSzk+X8=;
        b=eNA4eI41UHvg+yNS90AshqrcR//FFpGxQcN2Mez7BJ3DhEFpbrPnZQgiHm9iq7PRR9
         tr4V8NAX+4kYIuHETTXLAfHjcPGcXioLe46o4yzvQGaFDGB8kg5GWM55R82Psad0Z5bC
         HMpV9MllXD3VQYl7S6ECfxIgAlk3559OkjyghgWV6UXxxXEeKvICR952LUL6UFAJMcpP
         mmqG9g4m5u2xoHHXdf4Snl2Ml/3YXNhE/xpFflvM+P1uyZORvPN7KuL+mlmAA3rG87F3
         WSKiDy05BOhL2wx7YgIjWgdM8jNHY0Oqni0Pt3yWznauZWYHmNK1d9xZEtV8/s1WeJK+
         I+WA==
X-Forwarded-Encrypted: i=1; AKwUvByXjU7wx0jGWuYa9GmKBAIDP+uE/oUg2qpQDDidqByNJPmvyl3wGcsPnU/TWZR/Z9vOe+treFX/t61Rq0POdgbW@vger.kernel.org
X-Gm-Message-State: AFq9FYKVMefutSh8NDPbpZn0AnFCVQ1MfJrsd6FElyYMXpffUPsVdKLs
	ofZtFOR0sdHXJfCNKxVn+TquQZTiyNW+dNPbCpVdvi6xZl/lEwx7htmLCC0AC1B4WRl61KRvyZL
	bgYReecqNiTzhxpqrMGXrv106Ll/dFY/75clLhAd0sVefD9jE1tTAjf/kIq5YG7nImd74IKBX
X-Gm-Gg: AYBFou1mkBCa293AFE2KilwIY3IhWpAiZ78X02hK4jD5EKMBCxGB8synazYypvFPGR6
	W4U01GgK15YECaA3Yt4xfs3b5EEFvKC17H8bahVoT+bLp2EktUaI5aJ7C2niLrx1YvWkaBjDnN3
	NYiFPy/tmuPyOcgaGlp/uePEwDokXCaDa/6+R8lt8v4cqpZtRQQqUGHqzsB3+Tp31GRv2abzLuC
	sBCxhJh+QMlj2xEvAIa67CySsHIb3q/I4LNPr0YVN0kroLisaRKpW8hX4EayxEyrY6df/4nBXpT
	lWFMYCuRkZS/yiuIntz69bKub1aYQR7vrWFokoTIFj4Y7ulQOZmBmCzziO/Uq2njzgVOd9m7bMA
	0umhBPudIxqVZlWUXMM5I4OdgkA==
X-Received: by 2002:a05:7022:fa01:b0:141:5281:8a41 with SMTP id a92af1059eb24-190a4f06512mr7988812c88.9.1792668761622;
        Thu, 22 Oct 2026 04:32:41 -0700 (PDT)
X-Received: by 2002:a05:7022:fa01:b0:141:5281:8a41 with SMTP id a92af1059eb24-190a4f06512mr7988744c88.9.1792668760893;
        Thu, 22 Oct 2026 04:32:40 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-190e29381d9sm12143730c88.18.2026.10.22.04.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:32:40 -0700 (PDT)
Date: Thu, 22 Oct 2026 17:02:26 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 0/8] Migrate PAS clients to qcom_mdt_pas_load() and
 qcom_pas_prepare_and_auth_reset()
Message-ID: <20261022113226.tfuhxqrtfl3c4kcx@hu-mojha-hyd.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
 <ce3f58f7-f500-49f8-89cd-611d8e1ac6ac@oss.qualcomm.com>
 <20261021130735.h7t2c7txqdfohrs6@hu-mojha-hyd.qualcomm.com>
 <zqu4sweaftstbt26v2u3ajzv7snnqswuyrktm7t7k5gh4zi77e@d6t2fpsinvxc>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zqu4sweaftstbt26v2u3ajzv7snnqswuyrktm7t7k5gh4zi77e@d6t2fpsinvxc>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0NSBTYWx0ZWRfX1NNrvykBNMtc
 SHHSRI2vHUSo1XRr/jOANO4+XQAfWxu6XsLk+nOFkcYrUy/Jyebr7SQe6YssiZFQZSBhQBXe7M/
 Ymm4zetJUsQwgA0mD79MDNHao5cigjk=
X-Proofpoint-ORIG-GUID: YGkBIvFlonStpsCVzOl_5ISPXu7e12ME
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0NSBTYWx0ZWRfX3CvKUorFAh3B
 aWxXIXyUcVYaXOjz/upywO4VZOAzyN0T5L9VKXqx2wRLetICMnh80Eo9tmOO8KkkaqPgTpexW9X
 b9X0qS5D+Gh7jNLq/3lCNn9hPC0221pRuKKjUw+TkVvFMubQHo/wO3UpNjcZIVDFaxAvzC6tGkX
 wp3QhNmOEw5Jl1/Jqo+eK1dWSdOUbJMXeDsAOKXDKF7PwOgEgFK8WcJISWZ/Qi2h8woeRRUsb5w
 YN0gabtDXW8fOhHONjYrs04qi3C/0cW5JZSQZj8mmLax/aW1+aOElEqRI8TfRmCvagjGRXwGT80
 ftKHRsU1A9Sad6S7WGGA0nN2mXxY36t7HP/zMrvaErrify7X3fehog0iBtwn6t/CbD6gsv/jYjK
 K3Mw6lWr4C8WyGKyLsIJAfMPUbIARtcZX3nU2KFR6HmxaMS2IZqFnO/JSJpeUwnGlmcMkFKa99D
 z7zcGwwwgDf/IssxDow==
X-Proofpoint-GUID: YGkBIvFlonStpsCVzOl_5ISPXu7e12ME
X-Authority-Analysis: v=2.4 cv=TIPQ2Fla c=1 sm=1 tr=0 ts=6ad9f45a cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=ZHN8ZsQmYYvh4dXIsskA:9 a=CjuIK1q_8ugA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220045

On Wed, Oct 21, 2026 at 04:19:59PM +0300, Dmitry Baryshkov wrote:
> On Wed, Oct 21, 2026 at 06:37:35PM +0530, Mukesh Ojha wrote:
> > On Wed, Oct 21, 2026 at 01:32:13PM +0200, Konrad Dybcio wrote:
> > > On 9/25/26 5:57 PM, Mukesh Ojha wrote:
> > > > In preparation to remove qcom_mdt_load() and qcom_pas_auth_and_reset()
> > > > public function, migrate every user to the new PAS context-aware API
> > > > qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset().
> > > > 
> > > > This series migrates every remaining caller of the deprecated APIs
> > > > (qcom_wcnss, adreno zap shader, iris, venus, IPA, ath12k) and then
> > > > removes qcom_mdt_load() and qcom_pas_auth_and_reset() entirely.
> > > > 
> > > > This series is based on top of although no dependency as such.
> > > >   firmware: qcom: pas: Make MDT buffer retention explicit
> > > 
> > > LLM has the following comments:
> > > 
> > >  1. Metadata buffer (ctx->ptr) is leaked, and overwritten on
> > > reload, because qcom_pas_metadata_release() is never called
> > > (patches 1-6)
> > >  2. devm_qcom_pas_context_alloc() is called from repeatable runtime
> > > paths, so contexts accumulate until unbind (patches 2, 3, 4, 6)
> > >  3. use_tzmem is never set, so the shmbridge prepare step never
> > > runs on SCM and the commit messages are inaccurate; TEE gets
> > > a real mem_phys/mem_size change
> > >  4. Not bisectable: patch 4 relies on the NULL mem_region
> > > handling that only arrives in patch 7
> > >  5. Patches 3 and 4 don't apply to this tree; iris
> > > iris_detect_firmware() still needs mem_virt after the load;
> > > the base of the series is not stated
> > >  6. Patch 7: NULL mem_region now means "map internally", which
> > > weakens the -EINVAL sanity check
> > >  7. Patch 6: redundant second ioremap_wc() on top of ath12k's
> > > persistent memremap()
> > >  8. Patch 6: ctx is set under one scm_auth_enabled check and
> > > used under another, which is fragile
> > >  9. Patch 2: the context now carries the full region size instead of
> > > the MDT size, which matters if use_tzmem gets enabled
> > > 10. Patch 3: stale qcom_mdt_load() comments remain in
> > > iris_firmware.c
> > > 11. Patch 8: no issues found
> > 
> > Thanks.  Will address them along with Sasiko's one.
> 
> Just to check. Did you verify your commits with the lockdep and atomic
> sleep debugging on?

For this series, I did not.

-- 
-Mukesh Ojha
