Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFA137755C
	for <linux-remoteproc@vger.kernel.org>; Thu,  3 Sep 2026 07:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421535; cv=none; b=DyKirsn9QwSXm7gJngedJcsYK7lfYkAW5b7pw+boNTqtj811Znom3PWBUSXWMMRPzZVwsrsdBsaBKQuVJEI/JotZI2HcA73CP1STKxbwAHbqsFqXafgx81t8F4ZjJX55A4tU+uCMN6NKhgZWr59UmybPCTIIPsTNSplsLuOmnrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421535; c=relaxed/simple;
	bh=ZpH0V3BiX1xeS5UP5XkVFneyRdbxvPFWZs3TtaJJwL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dFtDsSrGoWYeECo4kNLTc+EZB8rabR/uNwBGLulbCmBQmvJbf8AOqJSx/xPZbDcQQ6nraf9b2Fx+iilZR8owPV19fsLfqJbFRgmpzh/E+2NUoTKX4Brw1hDr2lPx26gtxrEmJuy7Ij9VKbz9GXxP1Ea46CAYsTeTju9Rp7YgSkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EOq7cMxI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cA40WU6A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EOq7cMxI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cA40WU6A"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lP2f721803
	for <linux-remoteproc@vger.kernel.org>; Thu, 3 Sep 2026 07:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7CSoZYq3KBXVxdgrzwHcBQJR
	+p1brH+pLBCnK12LtNQ=; b=EOq7cMxIfefwSGLvo7J5uYpH0oNc58JxoM6BMyuZ
	7SZwqLFNR+zcC/4rC73OVoyhN+r5KNn38gMc/rESMzrO6yWNuaYVnWsPiX3498aH
	7I4qcsyPgVptaeM+pv20/ynqTdClOCtzp5YQ59bEPJBoovY6QuYP0UFOiOIwr3aS
	16ZTd1282+fK1ddFs7dd2h8gbS+cKr++9oK1lLhgWqhBESUm0CWJR4hkM9bPI/6j
	yeLFWCiDRcAN1wb2fmEJqC7nTY4rOZXwOx9lsQZhEotrbOg7oS7ZD4hNhJTs37KE
	z6vP4xZZA73xixI4s4hteZWmRwBVWObSUvkpuiZHtVMmdQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrnkwhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 03 Sep 2026 07:45:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e4f946461so428637685a.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 03 Sep 2026 00:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788421532; x=1789026332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7CSoZYq3KBXVxdgrzwHcBQJR+p1brH+pLBCnK12LtNQ=;
        b=cA40WU6ACOW1NLwNj+51HAoAB4w6xe8usiHpbj5RM1Q3yHqrqMiR+6iwjr2LcEsy4k
         filNJLfy2WKqSbWtitFoSi+rATxbRMuLPknx0i7VYWY1rmPE6b4rKKMzASAyvd/yrLry
         Nex/LmSWzKKhYtECANpRSt6OLCNSRdArbeR4JYh8Cj169Q4HxbVFPLkR0Ouj/aI6+pKo
         t/wyQi5UhRfmFITCx7R8yV3XCgt1CB7UFEsNHP0Egeeiqa+74NZulpUtLV1r/cK140fo
         /fAVLctN72G3pROMEUiOiMxTIFjHtj/nmaqRtRqBbuMPFWeGaNQoqMulRztqX/qT11Q0
         4IWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788421532; x=1789026332;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CSoZYq3KBXVxdgrzwHcBQJR+p1brH+pLBCnK12LtNQ=;
        b=ev6mc1jRvRet0g4Hdi2Gi6ygk5lndntcxXfwplB5fjkrlfnMQqS1DKZ2HDct1HdG5b
         hi4hLgxszVLFAFPg1nZqn1ajt3CtOyQin7kHSwayH5hrV2PyNMHGAzjdJrJ2SzeBgp7O
         mFfl4aO2aerveIUowDJR/7dYcactvRAPz2YnvKKy4NmxYU29IZEnQsYPk3aALkikKfFV
         HCtqmhlLPHrdLiB8/SOAkURhUVFULALFor2kNoADRfueqlN8jdcS2tWwQjhSxQT6PMT3
         hEzcmv8k52KxuK9NkaFBmwOf7nmlLeuo+E0s/7ajr+q5qLtX+zGp/YDTkol55osfknvW
         I8hw==
X-Forwarded-Encrypted: i=1; AKwUvBzzhwD09Kp8D3IwTNR9vDmlFANuUTG4iNdYNstEjMQYaPW7cjEf8nmkUMkLt0ZKta3cSlW9C0gqwYFiDRBQYGY0@vger.kernel.org
X-Gm-Message-State: AFuF++l7k9N9BQl+imxmPFM5zt3P+j5t5qJTRBghh6P1tbFRvrw7GijQ
	+KdxAsbW5M/+O8njCFIiTKGWOc+NuMsHXT2B4EsM6bN+805/8Y0cQry5OqEtxW1GheMLiKe/Ju4
	So0wLR0YeFDtEAYQdYQK9K1C49uSb4nwnBKFR1MUD1dFe1sviKIcflnTXPD/0HBvnR0AXzfah
X-Gm-Gg: AYBFou0Ol6953vsZwGqVxXmsy9/23M34C0Hg9tZnFM3b+o0pHCHexRC4vvG9BpfT4O7
	T8K83LRWFHKkb6+4D5eVExnkmozAX36tugVjuCxfuDsUGyQiICJZ/1k2U16nB8HOTh08A3vcshe
	IagXZQLEwf8PGwlaqRqeZ35JmnmR16xEtQf/L0vcch/omYaye/X+oCDommFxkB/eQ4tqSbfzo9o
	eOv8tcvwgJ6pRg5tIrldiX972B6kemzIi4EMmLLKBT4X4Tkz4DpyvuxFGc4zVnMmBy6W4FdyJ8D
	/h81sYJZWhpNK4WmK+inMZtI5Q1gKr6iudps0qgjoJ++wADNO5FQkyj0IA57PYOkuK8HgC9+XoM
	Ckhq/kolohcphJ1wyLEKv343r4iBN2gMOEosi/w7DOZQE4kvVac2AIrKXYP1/3j+7ZQc+PwD19M
	jbnI7PMrd4qoI3
X-Received: by 2002:a05:620a:468c:b0:92e:745c:6c5a with SMTP id af79cd13be357-93960dd6fa7mr1181097785a.14.1788421527115;
        Thu, 03 Sep 2026 00:45:27 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:92e:745c:6c5a with SMTP id af79cd13be357-93960dd6fa7mr1181062185a.14.1788421521913;
        Thu, 03 Sep 2026 00:45:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606b0f173sm1111969e87.7.2026.09.03.00.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:45:20 -0700 (PDT)
Date: Thu, 3 Sep 2026 10:45:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] remoteproc: qcom_q6v5_pas: propagate
 dev_pm_genpd_set_performance_state() errors
Message-ID: <kaad7btqyhq2puyjjnm2lp5e75hjizhpnaiyaol74icpkcfjlm@7yzadtvizm2e>
References: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
 <20260902204334.2061226-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902204334.2061226-2-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-GUID: tEAS15vdBc_sIVI6c4FZiuzpoA2uN8Rc
X-Proofpoint-ORIG-GUID: tEAS15vdBc_sIVI6c4FZiuzpoA2uN8Rc
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a99259d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=h89225zfqaSm5xtrkw8A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2NyBTYWx0ZWRfX9at+wdH/rZiQ
 13XCd2Bt2Axm3v3JSXrJSA/t/A0p1P83pro34OtktlKq5r00usaUgsjbHDiwOrppVDNTM6vTeRP
 03U+8a2JFLt18/KEWHo+IxV0nZicdfisOC7VAgzlAgzcDoO/ndkEnIo0iov0vlMAqVPX7sQ5a+y
 iMyI089csCXIx7EFdiqq1dRfMTT/p+Ha6917aFgJJhYIgJK/WiZdygf9bmUN5XpzI6b5dB708i8
 q8PsCq/VoJ68t9i8RUIxxFr8oEJZLM8pEO6YFslAnekxEMuqdMMB7uUtamccNxyQ0l3vXhYgKWY
 B3JfkrldXvizVl4lxdgAx7X/3pZ5Se/2dWn5u9vsR9fvzoohhD7QOdrkt1aTLelwAcudODV7Rwg
 ZVqer8qMIa7beEi1GQEnmt9GV5hDqLE+eYTjlzDdTKAYlCrX9or4+dP/gRvPN2jIqI7sqgA7GHE
 xhbY5N8mHFNdKyuVZBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2NyBTYWx0ZWRfX8UJH0GhaSy55
 pjU3kJR75GK7ydKaGm80WLYTH4sY8yVhWbpvfj5jYG/k67J268bQsXjjdupFhFJuwFuG1q81crM
 pcXosu5MgNw+fwIwrlk7qy9Y7iYsjD0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030067

On Thu, Sep 03, 2026 at 02:13:32AM +0530, Mukesh Ojha wrote:
> The proxy power domain enable path discards the return value of
> dev_pm_genpd_set_performance_state(), masking failures silently.
> When the call fails the performance state is not applied, yet
> firmware load proceeds without any indication of the problem.
> 
> Capture the return value and emit a warning on failure. Firmware
> load continues regardless a performance state failure is non-fatal
> but the warning provides a visible signal for debugging.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index a005546c265d..01dc0194e130 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -167,7 +167,11 @@ static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
>  	int i;
>  
>  	for (i = 0; i < pd_count; i++) {
> -		dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
> +		ret = dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
> +		if (ret)
> +			dev_warn(pas->dev,
> +				 "failed to set proxy PD %d state %u: %d\n",
> +				 i, INT_MAX, ret);

Should it be turned into an error?

>  		ret = pm_runtime_get_sync(pds[i]);
>  		if (ret < 0) {
>  			pm_runtime_put_noidle(pds[i]);
> -- 
> 2.55.0
> 

-- 
With best wishes
Dmitry
