Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6D63C415C
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 09:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781171341; cv=none; b=QaYt2ZKybse7ypW+WNc/1vTR8eTlamyecmX4FptV4NJdfnGsty9gcKIWus9ApFcEJxh1JDjdUN8LEGmO6b0CZYx3Y61NK7N74AICg6NO3wEiIuO7QQ4YbovCcvFDA7lLPoSfPdxuYGUcbfL9pL1RL+QXH30MUn/n+JTpqND/GJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781171341; c=relaxed/simple;
	bh=MnCyhCrwDlxMgkrlhfV4TtEa13o1YzAgTfd9QKqA/RM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=reOnOBExymSvs7w75834WHnmSj625D8EP70M5owzIahaenYhR9nCLs2qQD4YIz8dk4SGW40esonTfJK1KKPshrwfZhc2ZmDfz4wO/VEiTvh1gtM6gmS3VuS6QefhPG8R59j0gbait+MVPOA44RN27aVhX4IsIcKCGACFFaDkZE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HTXYhWGE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RfiwqYZP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HTXYhWGE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RfiwqYZP"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GQJ83817133
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 09:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7Knhl1ddna0y+c4FljL/Lxt/
	HMyCo8T516/5MkE1l9I=; b=HTXYhWGELZhL6EGdTFiY6kPjdSwirLu9HgyPTmrs
	1U4qi4GjKUAwbRr9T4IZYp2pja6Ct+4Jvy9VTdwKMp4962mtaHYLWkuqmoAchmeV
	lU/PWww3BkhBgArI+IkxgVnGXhR5sJtOG8Ka4jLI8JHYw6kxxkyLoA47eb17qMEs
	BUKcpRHf6OH6q6GmS5/2TE2rqL01AVN4EGzJretpTwTUrkjw57vaBX5w3UILUmkp
	/NBVG9bWAZ7mUsszcuslcPrgNcgjEWpU8fEy14P4UMbkOwITXT/Khh9I2XmKAXX7
	zCbYWJSdUJRPxcIQq2+igmIWqjG3+uW+6vn+Nm+txDJJDw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6utryp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 09:48:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-842cb4c62f9so768010b3a.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 02:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781171339; x=1781776139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Knhl1ddna0y+c4FljL/Lxt/HMyCo8T516/5MkE1l9I=;
        b=RfiwqYZPg9GSThRMq3IiUQZ4iO8Kun8N8MseeQQl+v5L6W6arM3y744b0kTFo9R2eZ
         9eWGfxMsKp75o2C5h5gAxfT8edsH41JJ8zGelI2+i9nYkMVhJsRS0MaHZa2Ka7VcB9BQ
         XFq11Mz/eQIXHCC5ccOZltYKOzm8jqJA4r/ZVec9AcGyWztgik7OX6I4skyWu84TQB3z
         v4Oaq4CmFttvfY/m0pLZm8jCow4uh87jeVEAbyM3wlLHOJ23ZZ+peNUA7suHs45O+Ot9
         zXopjSp1bpky/+bn7N8Jvd+uj9yPp9mW+ZWtskQ5UsCnnlbVu3+vWQLYito2t8B+83Ox
         uyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781171339; x=1781776139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Knhl1ddna0y+c4FljL/Lxt/HMyCo8T516/5MkE1l9I=;
        b=AJwl/l03g5rhKqDKVWHqAQpf41dpqTwvvBKW2Zd7LbIfg4i4nnP14RtV6Y/Y2W3iYE
         qg5GdopT1JfHKOBLufud9cr2RImV5XSTz6bRHrtv6300oeEJsSaZBfWov6cNkNrWaf7i
         nZ5M0es1cZqgMPRAEpCPm1V5cF8ADmAtV1UFo+vl0G3nGSf+l0oVf8zufYxkagbSj0Nt
         aDO5jB1LWvMu36fc9MiT7O0lTkUPC4+jCNRNlaMCYLHumzVIxyGasBdynq0/WixWiKho
         HZY409gUj7NGJhGq00MpJ0pftgqDibk08pWObi8isnxyqP+uhcGKTl8jSSKf+Eta4vCD
         xfAQ==
X-Forwarded-Encrypted: i=1; AFNElJ9NHaMkTZmIC+O207BkjZVLgQSOAW1LxZV4rm7y9X75vI8WNOAs6SPpGjoVq7epTMwAj5cIjT1jI/b/ashaMNqh@vger.kernel.org
X-Gm-Message-State: AOJu0YxLzULCq8sGWDmPupBWxg3ovbBsyP90CO3LOFTexLjDrL9iNUgi
	v1lJq16DKfUm+AA4FlpS+nVOzab1HG/jiF+Fnf4hAUqEgU4Xf1tXwPexalRiccqvgwZSNwY8rXQ
	41UyBDxi9WUp339tqgDjbBTa4p/A6YHvTRRqkH6gykt+hIJ7eNDNw1GqiURREmWiK76Qri5iO
X-Gm-Gg: Acq92OFWlVmJWIud3wP8DKakpZEIRK6EnDwYM350Y73bDvETI6EzoyVML55AMlxTrev
	9TnbsTjpRe7Yq/MbTt/M27njXcNNmfI32d3CAwhOPF0Suo6IKbOWRISuASO7eCSZrjXp1/tzc9y
	CsSmpeS4qdC4sa+qkqe5bAVWs15JRWTJWyM1iSsrGI1GJ4uA/vcSLddXySoozeyrALs3n+7yy+K
	ku+AN7OlAro3d7RnxfZwd3WMQi13sk1qhlL67RXGF1jOTGQjEmCIJD4bLPYc1VBDMBCavz7n3eQ
	vuOSLjgy/mpsad2TtbKDAALo/l5dmBvqQavYpzFnORVh0jgIqSdlGQDnq1IjYU1EBdxw0p1FiGz
	yqKdpp/9QHMNegPZ3NGquRAYkop8ndJmNN6uVk6bdoav44xnZOmKKI7IKyBM=
X-Received: by 2002:a05:6a00:32c7:b0:842:3804:590d with SMTP id d2e1a72fcca58-84335ca2a09mr1911946b3a.7.1781171338874;
        Thu, 11 Jun 2026 02:48:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:32c7:b0:842:3804:590d with SMTP id d2e1a72fcca58-84335ca2a09mr1911929b3a.7.1781171338292;
        Thu, 11 Jun 2026 02:48:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-843380c9590sm1945195b3a.31.2026.06.11.02.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:48:57 -0700 (PDT)
Date: Thu, 11 Jun 2026 15:18:51 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] remoteproc: abort subdev stop sequence on first
 failure
Message-ID: <20260611094851.dkg63rqztsv2pre7@hu-mojha-hyd.qualcomm.com>
References: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
 <20260609102254.2671238-3-mukesh.ojha@oss.qualcomm.com>
 <aif8VS0pLYurFEho@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aif8VS0pLYurFEho@linaro.org>
X-Authority-Analysis: v=2.4 cv=FJ8rAeos c=1 sm=1 tr=0 ts=6a2a848b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ot11TjGKcjkNMLPY8p0A:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA5OCBTYWx0ZWRfX4LSFc9G2Igsf
 wDlD4COwoh89iB8wI23VfRmu6zuwl4hHIy9aRozJwu+YeJuGj/sD23fJ2tFmQ0WSmX1QwH8j70I
 YGERW/WGGo3yyG1aCGYRISvNdv9iRVI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA5OCBTYWx0ZWRfXwgi+5VNcDjlh
 E50jwcQkxPjZA4E7GaoDKCp+MTKblhh1cPnEmm7p4akdas5q+hDObSg4T7IQInGCSDfhA0FzOM3
 zSeK0LiTAxKw19dRceY4TckB5wX9j416nctOFbh07FjHGa7xQGxgIXC5ZzZrTwRq64vXdfe/Dbs
 DKjjia2yVVShoQpIhEJEGNeTB0psPRD+IIeBH6SjdTnMnR2xRSDOqilKVwDVfE9BSqLXUBHtw/q
 FqgKoRQc0l6I1qrUGnbXajChOlonY+QsN1W2UfjKPvxITJP49AazulxZcm4j8HnynYv/llJ8qe0
 KqSFZCQ0+rwBWZZXnqeZP7Rwfb9avBvW2j++4ioQKqSriqBoIRFIc9qzF0ctrXSGT1R5Os02pKG
 aeVs4s3GsYJST2gT7I3RNUMZ1i1hLPmLVd6wV+25uBE9YRhF8mPSGMLE2MMHUO/CJMRJAF05u8L
 E69HMbour8/mjJhLcQA==
X-Proofpoint-GUID: QPYRRVusFjDn0CHE5neTNJBDbx7fx36M
X-Proofpoint-ORIG-GUID: QPYRRVusFjDn0CHE5neTNJBDbx7fx36M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110098

On Tue, Jun 09, 2026 at 01:43:17PM +0200, Stephan Gerhold wrote:
> On Tue, Jun 09, 2026 at 03:52:52PM +0530, Mukesh Ojha wrote:
> > If a subdevice fails to stop, it indicates broken communication with the
> > DSP. Continuing to stop further subdevices against an unresponsive
> > remote processor could close rpmsg devices that could remove the memory
> > mapping from HLOS and in case if remote processor touches those memory
> > can result in SMMU fault.
> > 
> > Change rproc_stop_subdevices() to return int and abort on the first
> > failing subdev. Propagate the error through rproc_stop() and
> > __rproc_detach() so callers are aware the teardown did not complete
> > cleanly.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> But what would callers do about this? If you abort the teardown sequence
> half-way through you now have an inconsistent half-stopped state that
> neither a new call to stop() nor a new call to start() could recover
> from. That doesn't sound much better than the SMMU fault. Or am I
> missing something here?

SMMU fault result in device crash while other is non-functional remote
processor. From Linux side, we do not know the state of remote processor
when the timeout happens..cleaning the subdevices can result in the
debug data being lost for hung remote processor.

> 
> I would expect that we should either be able to tolerate the SMMU faults
> with the resets involved in the remoteproc stop/start sequence, or that
> DMA gets cancelled by the remoteproc stop sequence, before the buffers
> are unmapped. Perhaps the order of our stop sequence is just wrong? Can
> we unmap the buffers in the subdev unprepare() callback?


IMO, Sequence of subdevice is fine 

 glink-> sysmon-> ssr     start

 ssr -> sysmon-> glink    stop

glink subdevice gets cleared due to which this issue happens.., it will
not help as we are ignoring the timeout.


> Thanks,
> Stephan

-- 
-Mukesh Ojha
