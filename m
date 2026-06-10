Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A0940863E
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jun 2026 13:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098972; cv=none; b=H5Z0Ngfv7HfzH727xr2zY71PnOH/z35UBmYJVQ802ricXKY9ZGxudoI/bw3grnXjeVFWu+KWhQbSAnBlU178VlsoeoyzPlfByEhyEnfotiqqBW0EiaLQmwJ8bqvMm2GQlbI8dhJNZ1y5GPBtJyBze/zCEO088jNfeWgBIoiPURg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098972; c=relaxed/simple;
	bh=c8ISxDyfYFd1w5V9y3jPjVnvxApMDRuA644CwzX2/xY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=csjOWQTN8sOnlIi5P3QSeHQMgG0FAOqF1hwABQTwTJ1/QIAlxPCGJsBG+ZGSjvStuK63wuigI3ZZv4W8etHu6ET1j8YsSFYJMUx7TFiYuOPUirqnYDsBGjcWBDlL0DGArfq5leUhBPQfyHWROcUipSmZF+VNTxzdwih2afSaHfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=neXsZo1K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vz6RWsPJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="neXsZo1K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vz6RWsPJ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACCkZL1598706
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jun 2026 13:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7cw9iU6/+9ipC9Le/D44AKlV
	MjTt/IKZwjG7uxs0FvI=; b=neXsZo1KP+a3Nf60THwlHRvRrbZn9IdlC3Paea4a
	rNUmOqZfbIvw2LpxG1ZtxowvldG8W7CT604ERYio5xihbms2JQdhPnlXsf4TO3t2
	BcMsSkpw8I+XWSsantCnM6faVrni/hN+Qc/kMLQtssJNlYKt8I3IpfwhYa9j2Xb3
	D+ONTdJVoP3UASbQDwv7NkUX+UMVWGhyFdjxMyf5BzGoyU1h3GGIkoApd85ytgCy
	DF5AlY0XqP9Sy33d/IgoA6hfwMpIf1w5sYhcbNiIN4rrs3jH1jN8GatOcXnKbWe4
	oqryT/RQ+HtH6+wFuHbtA401Q5HzT8R3VsXUqkPdG7Isog==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq2sehmkv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jun 2026 13:42:50 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c89de84f33so7079959137.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jun 2026 06:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098969; x=1781703769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7cw9iU6/+9ipC9Le/D44AKlVMjTt/IKZwjG7uxs0FvI=;
        b=Vz6RWsPJ3jCuDHOA44NGyfyEinXqaBD4CGv2qx7XU2ioImvCgAib2V0ZlswPHBX7t0
         kFPHLEZ4LlZoFhhYk3eCzgVfB9zebVGQLs43n9+dzYzGlZS4pwIv7ccvcENIhvK06Wve
         Wtox3HymcVr/iN1ad7Nxvi0e4FqVO+kZnoMXU3RyEEw98bqhEnBlzhRHOlO8B7cNmzHc
         TBCfqEVhsygMeF/4+f4CiMtcdHz9zQiGysqFWOLhMDYVk5x4kRLbPZlVSIwMBazMk+dz
         ou3rUODc1q6SRgjRkjhs9PkzxTX8DtWFkTMZZ+tzwBkepISUEnM/451DrpzFHO0YkwYf
         iBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098969; x=1781703769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cw9iU6/+9ipC9Le/D44AKlVMjTt/IKZwjG7uxs0FvI=;
        b=rYEwKDh+IZ1/SUQgd9gt155O5EjSTkjtrQnYj6rFPAzr0Z0w+8w5PTqQM0aaiIX7tG
         6+E9VNdsDogw5cZ5EW/VLLgKOUP1u5X9E6nT2oQphnnNVt8E1fpBAasbMKdGMyJfIbH/
         JYX79Iwz89c+5VuXGs5dgvoxA/Y9XHSC33zBFW+0rsFzNC7fC3t+l7w7f/qdso6WZtWO
         eik+bAogtbPveq4V3wC3FdF5fFtXAnQWQuelaCv+VgHeX16XIH8hl1KPmJIV21sGSgHX
         Wj8BatWTE59BIJNzIO3aWlGhwjYu4VleNUE9oqXzW2S9RUaE25GmBkax+AJ87gH7ybkV
         h2pw==
X-Forwarded-Encrypted: i=1; AFNElJ9WpQ/MTodqOQfXANrs81Qe4OL2z3KdvZJ1FYiIiRHHUNBPKI/LxVRyObhq+NdiO7HKPvK1i/FVgbLURTdmqNH7@vger.kernel.org
X-Gm-Message-State: AOJu0YzYYZD+Oc6l1wsZ9IaaMgqs2KfkgzgV5Jsj/zT9+Y3TpqIaTuDQ
	3tp6LPBjRG+zOUbVcK0IrwjIDwVFs+IeSdq7bTx4FOwr0UFSdjVfbuX4/tQNzKH7CxYdI6ul9E0
	YeHTtAlkIoiWDTGqrVvltdhp/gJ3YvOjklpINii6cw6rP53Gc+tPY1ViRgRrLX45ApeRoLIcb
X-Gm-Gg: Acq92OEGMg2LD99vxUrW0NVLlv7EZ1NhPNbIe9NfJJOdzdem5fBfQMegfZNJG/QMyDt
	v/MERvlw2tZ/gQt8R6Zuaij8nb4FDWYuOzMrzGndgthAsSts5K/bZtItN1/5mdcDDNGfyuOxxqG
	Fb1olaU9x9+t3SZrP5KQbxdcKpCkfZt91dYGirIv9/1G2wbtjoPu6WEHgOc282r9nh11rbKhHHj
	n4mNbSJ6JKQVmvaL1Okb05MBL178PraR/kZa3ylAk2mi1Xlxlx///wKUHBOFto57HyG/u/IK79D
	B1qZJ0ms5jdTVc9WZtY02ROABLxVQ5QDSbnnzj+E0dOm3i05xRJ0Ca6qH5UkBUZPrFJzhSxI2ER
	9Ef7W4AWTuhLo9f0jJghG43F2PGWfyoZXDw8EWSre4gGIN5Hw1yDIsjwRPS4s0xg8vaezdHWfZR
	7OYLdyM9Oq7n7oTtmTcu5Fy5DlrJPJvxrfP71KqlsjpkSp+A==
X-Received: by 2002:a05:6102:441a:b0:631:4580:6a33 with SMTP id ada2fe7eead31-6fefa60c038mr14992241137.21.1781098969419;
        Wed, 10 Jun 2026 06:42:49 -0700 (PDT)
X-Received: by 2002:a05:6102:441a:b0:631:4580:6a33 with SMTP id ada2fe7eead31-6fefa60c038mr14992212137.21.1781098969034;
        Wed, 10 Jun 2026 06:42:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8edf4fsm5429249e87.16.2026.06.10.06.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:42:47 -0700 (PDT)
Date: Wed, 10 Jun 2026 16:42:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Casey Connolly <casey.connolly@linaro.org>
Subject: Re: [PATCH v3 2/8] soc: qcom: Add support for QMI TMD cooling devices
Message-ID: <awmoxzmrgqzot5yfwpoml2olntpultuguuvdfvk5mt2lxqjxqj@n3tsmix64fdb>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-2-291a2ff4c634@oss.qualcomm.com>
 <pyt62qpa75nzdatp5xl7vcqrdzmrzsf5ethw6wq62bzg6b7qtv@ts2v53im4bos>
 <33fe758a-a733-4f27-8824-3dff398e1cd3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33fe758a-a733-4f27-8824-3dff398e1cd3@oss.qualcomm.com>
X-Proofpoint-GUID: btV-FrnV79Hq1X1Zaz2O_Xz0Zi1ZuUX4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMSBTYWx0ZWRfX81AjDFWZEjJo
 K/B+ZxbFrkhkEz8JZK9awDNLzAgvY4gOOB8JVsBxKP+Nd5UGx4aZV8HtS7Hil4dyBGeQhYueRux
 sscSad6ybIgAXToSyrVwtU7rgNtCiIfu8J4KHsoOhTfb9RulQ4IgRyrwvF81Xg/0DiWtyWv9aCQ
 sM9TL8LAlkS6kxko2O84JToZnf9NB+teumOJW3xl7WzEFGxJhlgaiGr/fPVDw03HNl/yx7Xzfu6
 z6GLAb4/G0Qrp2/qn2XGP0wC3+eC0WT7G4JsamwdSUK1aYKMq+2Jf9WbwykxciuEP2XaZrlWbfu
 ax2EkllGW9Zw6t01A4rFjmexdMrEIWbXFwkTFpZ3Gd7TgO0T3Uu7uKQb1HobcWDxjuGWmWL7hec
 dDEX6G/VdiM84d9GKw4s1t4xQs++HvFMkgOHz7s+kHBVFGgzYH83ClSQLPr1s9ofKJxoS3/np94
 3cuFtphc/aBBZ/GihoQ==
X-Proofpoint-ORIG-GUID: btV-FrnV79Hq1X1Zaz2O_Xz0Zi1ZuUX4
X-Authority-Analysis: v=2.4 cv=Md1cfZ/f c=1 sm=1 tr=0 ts=6a2969da cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=OdyHppD39TW5BxundB8A:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100131

On Tue, Jun 09, 2026 at 02:08:57PM +0200, Daniel Lezcano wrote:
> On 6/9/26 13:30, Dmitry Baryshkov wrote:
> > On Tue, Jun 09, 2026 at 03:52:57PM +0530, Gaurav Kohli wrote:
> > > From: Casey Connolly <casey.connolly@linaro.org>
> > > 
> > > Add a Qualcomm QMI Thermal Mitigation Device (TMD) to support thermal
> > > cooling devices backed by remote subsystems.
> > > 
> > > On several Qualcomm platforms, remote processors (for example modem and
> > > CDSP) expose thermal mitigation controls through the TMD QMI service.
> > > Client drivers need a way to discover that service, map DT thermal
> > > mitigation endpoints to cooling devices, and forward cooling state
> > > updates to the remote subsystem.
> > > 
> > > Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> > > Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> > > Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> > > Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> > 
> > Wrong SoB chain.
> 
> I think Gaurav wanted to reflect the changes did a back and forth between
> us, so I ended up in the delivery path somehow. I guess adding
> Co-developped-by should fix the SoB but won't reflect Gaurav and Casey did
> actually most of the work. So I'm fine if we remove my SoB to fix the chain

Anyway, Gaurav's SoB should be the last one (and it should be preceeded
by the CdB tag)

-- 
With best wishes
Dmitry
