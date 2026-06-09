Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C253FD15F
	for <linux-remoteproc@vger.kernel.org>; Tue,  9 Jun 2026 11:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781003125; cv=none; b=ZbeNHnkHB32O4i3tNqmczHbz8tPftSvHZc2p0QGA2Lahof3d69V34I1d2lTjVUMIVMEPMo0iToAZGyHw4cO91rAcZp0CulEHOwe0Der4hmM6yHIny05y0ZgT8WzKE2+tG5ZSHAiCDvFqs5Woyv4wtacPmPqHE4v3B3G4GqIuqto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781003125; c=relaxed/simple;
	bh=sdfJoX3weu/5bb4kZAE6iE0eMYM9msScYhHFBxigZbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8R8a+MWSNd9IgjpYnvuCrVg283/ht55u6jvzCT5LoH5XnsulwVNs4I1iXTXoPwoAKsIg7A6AY2mdLJRqAwdli6L3zT2ppFi47ltW7CVgxO2ZkEemdj2Fq4qrD8GCwZlXGggW1f8a/RWJlkjlYQHu8ReJzcCkS2pTwR/LXr2NgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gEOHiqKK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NoW6rB67; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gEOHiqKK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NoW6rB67"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599xGFD2327367
	for <linux-remoteproc@vger.kernel.org>; Tue, 9 Jun 2026 11:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rx28RGAmnnvmqWkKqwEakAwX
	zmzhLrzlkZYWSnJi9t8=; b=gEOHiqKKDVWAY2aHe/EcQnF4WPWtVZMw52z1/r0q
	kI7EJIsgunUKy8/08l4rWR4bSeFImrMm2cZM590FsuTIbEI1c3zVt8WYnTwfYvu7
	IPtDSVLWM6/p4NKvhqKUFKH1GgfI3xsMTb9p8QEY4ZLZRNxsEYQqyM4mk92CYIhC
	nU8+JPr19/wF7QENwWL8lqzl5WwRHat5satyF6T+pwrfQrfcDT5Aif9j1lHU7ryk
	gghfTJ2aDKHUxa0FeqtoSO5SGfBqvKJ3JU8baAnXhFDpEs3/QV3jPOunEKcOMPWF
	Nzuhfxgi6iBwBVBMAhEcr5+X1+TJFsnmAdfc5SrSLRn4eg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epfdt0jt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jun 2026 11:05:22 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c69c788ce7so2251279137.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jun 2026 04:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781003122; x=1781607922; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rx28RGAmnnvmqWkKqwEakAwXzmzhLrzlkZYWSnJi9t8=;
        b=NoW6rB67iEhKaQj/Qi7ICcmw7ChM6QZOaiafk8XQBq7CQwJW4/ABkBmgqiZYhG+R0q
         laD9PATUo2H9fetJnHvDdR//Go7uOW/Kr8jv1elMmmh8UqRUPjbIxaMtMR/JkcP8nU00
         kjJ5R/zzl1R+c3z3v6RkFA+yz6x5Uqk6Q6ziT5rl/hG6jrTl4j+roejBltZ3yvBG3+ew
         rUIy0VVAAGU7eCxgjheTQvn463iflBfXmIiF+xGRc7PQB+gaxZ5YOeyk+NQ8jxcpEfRi
         MmM/lC7uujlvBEPUyLAhFzTg+1WOA28ODCyhWIoM329jaqyBQXpunv8virWfTjZpkUnF
         EPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781003122; x=1781607922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rx28RGAmnnvmqWkKqwEakAwXzmzhLrzlkZYWSnJi9t8=;
        b=nfJbndMaL3bGCqlVpC/GBrF6XRAAgE8M8fc0FJEAWfaaNQF+xnNrETmtJ2JGqnmgaL
         FVdElO79YuyC41wkCX0677HUow7ri/onr0d7tk9rj+fWhZqzNUiYj1XdgDGXPFon4V/9
         81WBao7FxBySTGEOBnNYM0a3WZ4DLuPFsWV4nc/7MozQ6HeBZbzi9snpbqkWfMx7eqtC
         vIIuTnLgqte/YU7ZA72fzF07xLjmcGn0PNcH+4wJHQROtiinj7funn1l/vzYQOMQO93Q
         1wakr015e6L9Bz/Li9QQ8WtPJxiAK55k9BpBZGNLheEsptLRwMLIf+3p9v1HchMwGFXf
         Uewg==
X-Forwarded-Encrypted: i=1; AFNElJ/N3BKLcyp3CAVViXsee+Jax+1E7fgYU33IpnSOlV9Ims9RJvAuvwIGMZ3ENpn0ISIfb7ocmwumrLZHIGpoDD9A@vger.kernel.org
X-Gm-Message-State: AOJu0YwHOq/j3TgxsbyCdw/iJde6+3UceA2ndlLdW/IYTe1kOOFmQJf9
	xRlNFW1q2/dMQdehGHZU2hHXUkyUrH9bgnn6PmdweGdu3OQDmdu0/LAFBpP020a+Ftg4n9LrGa2
	Frc0anjUQ3lwBjHTInAeE5YPryczvb3SaesF9xJqTHeglc47gkVIF0TiA68QIEcCTUCGnij5k
X-Gm-Gg: Acq92OGcwpxBI/6ePNNUoxQOLrm8c2P975Bk74rHhpvmxEDlCm0d/EVPW3oSBoLryIa
	4RfhKegGuL2hHUfYYvIXn366HPam/am/vZuxKtZFzRFGiCO2IBjz43m2pnBwY9ta3DXign7iXaj
	pmJgBskPF4R8kCL3gQG4pF7r45yuEnnySaKhhNfdkVUyjxvH7xYsAj4wEU3Lr1xEq4dZW0ThDl0
	MznwDz/YG/BBgh1IgyKcDDKCSyiEH2/DuVR6Fcrr/fLK9fpeWJhISqg+ktqEw7al2DflfWhDnYX
	vBwKH53nJHqXexzkG6Z+95MlpixoCbBT39JMzjHc2N3bHa/sVkfKkXtzmxFlOp94dLppOx5ZMBp
	mfcpnYKywJMX6eZKfcQDlM/dz/gGOvz3QrLmsmkjW/hmhR1VCt4qZKwv0iTYBYGh8IF+RWK0esc
	tGaro2o+kyGiDX/tdu5CEq8R5rodWFLUqi/CBoBYCkxzN6Eg==
X-Received: by 2002:a05:6102:848b:10b0:62f:406b:1baf with SMTP id ada2fe7eead31-719367e1560mr450042137.20.1781003122157;
        Tue, 09 Jun 2026 04:05:22 -0700 (PDT)
X-Received: by 2002:a05:6102:848b:10b0:62f:406b:1baf with SMTP id ada2fe7eead31-719367e1560mr450006137.20.1781003121692;
        Tue, 09 Jun 2026 04:05:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed901sm4515726e87.10.2026.06.09.04.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:05:20 -0700 (PDT)
Date: Tue, 9 Jun 2026 14:05:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/8] remoteproc: qcom: pas: register TMD thermal
 cooling devices
Message-ID: <h6cat45sxkn3l5ispdtuf6dd5co5t335sp57ry4cbarwwzms6w@whokz3vvm5ap>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-3-291a2ff4c634@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-qmi-tmd-v3-3-291a2ff4c634@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: prnMGjwHfIJispKw2mlgTBiMRfH63Vhi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEwNCBTYWx0ZWRfX2a1hgmVQYP8m
 meO2pricMIlx0TwhArb/6uihlHuvsB/0niX3FF0Ka6iCtmaL9h5qvLFVAFIv2VkOTAECwavm4pJ
 /T5Uotl3yb4fvBvkx2eoWLuGp1z+MuAaFFlTtiE4PM4ZyOU5S63rAbefGKsj8kbCEQcDqswpPm2
 kP6kjgu4lIzzcv4nkj0/cz+YT9hpBEMJOiWih9ZkaxHvgAHk0l0PDdbapbeKRsOHyzUGyNdge8Y
 aSU+WbeeiLhuXmyg0HZr/VPkvYwUUPnwFRvaUleWBDhbb2VStR4Ou8olNuXlRy5JDecA99YVOp3
 sh/YGNr4/VPqPZW041/Bb/odppnhRX5rjBLh0VTHavgEkf3lELuIWBTmcEYZQmAIcKoTpLp3Krn
 2D/moLMGDrkLs2lvliG9a6U7L5c9XdfQOsb+Ji9yNNHIVmu/kFoEbdmb+oHjThBItKJS8EnIXSM
 QimvT5W5b7WophceZCA==
X-Proofpoint-GUID: prnMGjwHfIJispKw2mlgTBiMRfH63Vhi
X-Authority-Analysis: v=2.4 cv=doTrzVg4 c=1 sm=1 tr=0 ts=6a27f372 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=MAJYu3_Ptnbw-qWrP8kA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090104

On Tue, Jun 09, 2026 at 03:52:58PM +0530, Gaurav Kohli wrote:
> Add support for Thermal Mitigation Devices (TMDs) to enable
> thermal throttling of remote processors through QMI.
> 
> This enables the thermal framework to request mitigation when remote
> subsystems (modem, CDSP) contribute to thermal issues.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Wrong SoB chain. Yours should be the last one.

> ---
>  drivers/remoteproc/Kconfig         |  1 +
>  drivers/remoteproc/qcom_q6v5_pas.c | 61 +++++++++++++++++++++++++++++++++++++-
>  2 files changed, 61 insertions(+), 1 deletion(-)
> 
> @@ -733,6 +737,49 @@ static void qcom_pas_unassign_memory_region(struct qcom_pas *pas)
>  	}
>  }
>  
> +static int qcom_pas_setup_tmd(struct qcom_pas *pas)
> +{
> +	struct device *dev = pas->dev;
> +	struct device_node *np = dev->of_node;
> +	const char **tmd_names;
> +	int num_tmds, ret, i;
> +
> +	if (!of_find_property(np, "tmd-names", NULL))
> +		return 0;
> +
> +	/* Get the TMD names array */
> +	num_tmds = of_property_count_strings(np, "tmd-names");
> +	if (num_tmds <= 0)
> +		return 0;

Propagate the error?

> +
> +	tmd_names = devm_kcalloc(dev, num_tmds, sizeof(*tmd_names), GFP_KERNEL);
> +	if (!tmd_names)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < num_tmds; i++) {
> +		ret = of_property_read_string_index(np, "tmd-names", i,
> +						    &tmd_names[i]);
> +		if (ret) {
> +			dev_err(dev, "Failed to read tmd-names[%d]: %d\n", i, ret);
> +			return ret;
> +		}
> +	}
> +
> +	pas->tmd_inst = qmi_tmd_init(dev, pas->info_name, tmd_names, num_tmds);
> +	if (IS_ERR(pas->tmd_inst)) {
> +		dev_err(dev, "Failed to register '%s'\n", pas->info_name);
> +
> +		ret = PTR_ERR(pas->tmd_inst);
> +		if (ret == -ENODEV) {
> +			pas->tmd_inst = NULL;
> +			return 0;
> +		}
> +		return ret;
> +	}

Assing to a temporal variable, check the result, assign afterwards.
Saves you from the nested ifs.

> +
> +	return 0;
> +}
> +
>  static int qcom_pas_probe(struct platform_device *pdev)
>  {
>  	const struct qcom_pas_data *desc;

-- 
With best wishes
Dmitry
