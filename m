Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46253AEF3C
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Mar 2026 18:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772820365; cv=pass; b=JXOeHsvnZVx87wggK+k4yotttgzYwZrFinWMCZge/JJtYeCW9w3/e4xM02C1Y6A5eksyYDb7LGXqfmq68/+dEmy1lKq+lnvHuySAoaIbyHT8SS5NMM2VULmKey3QuMd3I0XXzLO11aIXpchvAEKtH4BhZWrUdxFcbohllw3mhps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772820365; c=relaxed/simple;
	bh=gTr7Tq8iACpqbyVR9jDz+kdN5xKREoo57nUaJ5OZEJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ald5yeHnyfZB23mt31vD8ypKTG4qjZeXatzfuM2TX0mloQDLqU7CayTHGvpTDtJcqDv3fr3FimOTF4DuQoDeXRejYE3JfglCCWt/5lbtRjjhW4aDMRRwbObBK/7O6TxP6k37aqKSE4WLRVzfax2bPGYANPYejJ+lp2LuouKpPAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T76Ns3nV; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T76Ns3nV"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439b790af67so3642243f8f.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Mar 2026 10:06:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772820362; cv=none;
        d=google.com; s=arc-20240605;
        b=g9ttPa70sq3cDnZr0hTYb8JBAZXkbyHmwTpuANWzg1OqJKrFTu2J4xfcFyBd228z60
         5xoQWBBhkTf7XJEW0EViIDxm8OhFyjzReExWxdSqbYfUfOc4lV98cbRRjhUj+ppgtzQl
         vLxtRG7hMZ5rEOK9XLThMMIKiZj7VmDLHNn2N9ASkVulirD+dZxc7N7QoD86xbKkfGSa
         B6Jtg8k42G23dWxPnLKMGpcTJB2El6fgGOW39EIDFIA9Ehf7sNY6Xzlk+uwINsORmA5R
         7fea1l8fay3wkr8YZJPcIPgov7bY/IMuwYaQGfLF+LtV91aQwz7Kdqxd77zyJNKBlsHU
         61jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A/dDWc/gnlxKUDh7QeLsWpq20nM7X8WSl+8DE7p0FbI=;
        fh=ptBPmTn1TD8/L+9GDsLj9yGM/PAcpL9kXTOXft5N2pA=;
        b=NWxcuLahvmHBAb9jtxcnd6LjKdng3PlW/9MowAjnD36pDMjctthQ8nRxr0hpEoUx24
         UE/4hcLS+nCc8eTC5EsE/qV90cQHdcwTs86gx5v3dpM1HEpLx1GCXvlyeoUKeXV6ZBmz
         B4P9ownp+TsthP0iSvjtkVlGD+O0zMt5rW+t3ddRbul8dZoFVucODppsJgxcWP8K0Fwn
         1JO5OnOB4HJsWeOc2NpDeC3Ddm1c9wRKNMgC4BRKHk5QCBsyH+hkkzZU8xXlCiT0fS+B
         /3BU2LFWUJuX9nwMYsBiBm4gkf/4zawI5NDLfKNFV2Tx/OKSTBn/T9Kcz2FjuB4botqx
         2S1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772820362; x=1773425162; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/dDWc/gnlxKUDh7QeLsWpq20nM7X8WSl+8DE7p0FbI=;
        b=T76Ns3nVZ8acmzK3iIpKn3/5cnSWz1R1w7vTarOkD03aVodxBCuYTV2Q3DOT6zlStu
         acatMmCAfLwLgJJcZrS7QVzUw2i4pmvPASsNlCL6KlPA8sot5U4lE5w/dLEA2Z3N8R1W
         Qwgn4j7xFFjSZ0uiQEa7t5m0spvJx+0+cK+wR9t3S09OEsrhAPRfxf7dVBckX9JCsg1a
         z70zVB7FB5GhpneU7hxN2f8MitKNSzfmDcTc7MUmGstWNBLi0i5Q/005PJI7EcSzDAf+
         ju4jDe8iGsstCNbgqTg2d42DG9HDQ10Ef0YD8G/Z1a5tR1QrNRzw9UuzitiA1vFt1N9w
         vY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772820362; x=1773425162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A/dDWc/gnlxKUDh7QeLsWpq20nM7X8WSl+8DE7p0FbI=;
        b=h9638cFPRPrQTaKsWpEti2PApsZSAiP0sgfvzVbRXVDTDs5VN6TRGI/cBFjKg4tm/J
         OKaIc07AsRO5JWsfs45SdNLS6x3+YPRaGwZscDONw/y+2MDGK/sqBVusL7WLEixCKG+0
         VbtBDWWXYjeS1XLLAwMxlEo7pt7RvuFsZk751XQ1LtjRM95aA4FGIaEm2D6SrXErFgsw
         ISPb92EhPdoytW8InhYTD8ZsYNsTDvI931xQZdrv/ycdu/ESeahKOdAjaUQb++B8sHhF
         CyWH4zGb/RrLQjy3XEu6VfBWV9hVthFzAKrRCNg8x0nZS3Kz2X0DCR70C3HFUcYHDfmQ
         Lo3A==
X-Forwarded-Encrypted: i=1; AJvYcCWnIXDzDoPDqPYKRwu9NerFzXUdUIqyIcS0Ooy/hBZnZTn5/vt9KPmrZx1by0vCWvmaH9/Vfzd8jdBFATKI4nOl@vger.kernel.org
X-Gm-Message-State: AOJu0YzURyPl31TPn5xKRY7lUyqobCbfVmOBcNhGSeBSwan8u7MIDAd7
	SLUZrUa5HIsiFkVf4w+nvNDyz62VGO7/n78+N8ouujGbl3lUgz8pTfTD8M5HPieYYMkKERySUtk
	4js5VFUMIT2fC2KAGA7CyynAX6Gv/1c8=
X-Gm-Gg: ATEYQzw9dM3P2nieue8QBrk0uf8Yx2KTH2yIDVVl7Ale4ceNceFg5RYlp1vM63rQi5X
	rp6VItCVyzKYuBwbtNsvY7LFIL/eHa2oyHuZ9KGo3HSScaJNutukpzdoLJsNejBPOWG9m7MZxQF
	kBS3NaXv0LslrQ7mVoF1iBniJYWcdmAaNwfuFtS5mRo360T7RzgZUA1gz3kcw2dXo9ks7ao+Q45
	uLp4Z/d+8SC+O/5U3UwWdf7jA0O9UChTmFoofDCVJvDcLVeM67WATdPKioUbP+uD2eNRdzN/LzI
	HZQ9XyD5zH5LPOwL7ii4H6YZ0fnRwIqQYGDaVNQkD00b2zKWN5Y7d91uqt9n3HSb1NarI4RbijQ
	NfJV7nEizvmlk6ld4HjHfos0=
X-Received: by 2002:a05:6000:3113:b0:439:ce30:5b84 with SMTP id
 ffacd0b85a97d-439da327d13mr5526227f8f.2.1772820362152; Fri, 06 Mar 2026
 10:06:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306004344.10968-1-kerigancreighton@gmail.com>
 <20260306004344.10968-4-kerigancreighton@gmail.com> <CAFEp6-2MVFXfz4=_Em7YkH_Vx5VcryWMdDnrwe8C0=TnBmknZA@mail.gmail.com>
In-Reply-To: <CAFEp6-2MVFXfz4=_Em7YkH_Vx5VcryWMdDnrwe8C0=TnBmknZA@mail.gmail.com>
From: Kerigan Creighton <kerigancreighton@gmail.com>
Date: Fri, 6 Mar 2026 12:05:50 -0600
X-Gm-Features: AaiRm532iLjnTqDjw7NIILKH4Fb3Iblc7XV8hlP-8BR1AKl_ztQg6PeShUMn_nA
Message-ID: <CAN6+ztzrTcBT+fX8VHJs3K9haygu9qwNHHhS8fMysbzehangRQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] wifi: wcn36xx: Add support for WCN3610
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, wcn36xx@lists.infradead.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 6, 2026 at 2:41=E2=80=AFAM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> > STA_POWERSAVE resulted in BMPS errors and unstable
> > functionality, thus it has been disabled for just this
> > chip.
> >
> > Tested on an Anki Vector 1.0 and 2.0 robot with 3
> > different APs. Support for other WCN36xx chips has not
> > been affected.
> >
> > Signed-off-by: Kerigan Creighton <kerigancreighton@gmail.com>
>
> STA_POWERSAVE is disabled, but the interface still enters BMPS mode as
> controlled by mac80211. If you get the opportunity, It would be useful
> to air-capture the power=E2=80=91save entry and exit events when this occ=
urs,
> so we can verify that the transitions behave as expected.
>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

[re-sent with full cc list]
I only had the chance to test it with one AP, but wireshark does show
clean power-save entry and exit transitions. Once I do more testing,
I will make a v4 which:

 - Adds these power-save findings to the patch 3 commit message
 - Amends all commit messages so they are wrapped better
 - Amends patch 1 to include a better description of the hardware

Thanks for the review,
- Kerigan

On Fri, Mar 6, 2026 at 2:41=E2=80=AFAM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> On Fri, Mar 6, 2026 at 1:44=E2=80=AFAM Kerigan Creighton
> <kerigancreighton@gmail.com> wrote:
> >
> > The WCN3610 has a lot in common with the other wcn36xx
> > chips, so much of that code was reused.
> >
> > The WCN3610 requires specific configuration values for
> > stable Wi-Fi. Without these values, there's packet loss.
> > An extra CFG table was made so other chips are not affected.
> >
> > ENABLE_DYNAMIC_RA_START_RATE=3D0 was discovered from the
> > downstream prima driver. That brought it from 95% to 5%
> > packet loss. The rest of the CFG values came from my own
> > observations and experimentation. The current settings
> > allow for 0% packet loss.
> >
> > STA_POWERSAVE resulted in BMPS errors and unstable
> > functionality, thus it has been disabled for just this
> > chip.
> >
> > Tested on an Anki Vector 1.0 and 2.0 robot with 3
> > different APs. Support for other WCN36xx chips has not
> > been affected.
> >
> > Signed-off-by: Kerigan Creighton <kerigancreighton@gmail.com>
>
> STA_POWERSAVE is disabled, but the interface still enters BMPS mode as
> controlled by mac80211. If you get the opportunity, It would be useful
> to air-capture the power=E2=80=91save entry and exit events when this occ=
urs,
> so we can verify that the transitions behave as expected.
>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>
>
>
> > ---
> > Changes in v2:
> >  - Move wcn36xx driver changes to the end of the patch set.
> >
> > Changes in v3:
> >  - Describe where the CFG values came from in the wcn36xx
> >    driver patch [Konrad].
> > ---
> >  drivers/net/wireless/ath/wcn36xx/main.c    |  4 +-
> >  drivers/net/wireless/ath/wcn36xx/smd.c     | 61 +++++++++++++++++++++-
> >  drivers/net/wireless/ath/wcn36xx/wcn36xx.h |  1 +
> >  3 files changed, 64 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/net/wireless/ath/wcn36xx/main.c b/drivers/net/wire=
less/ath/wcn36xx/main.c
> > index c3f0860873..6c90c13251 100644
> > --- a/drivers/net/wireless/ath/wcn36xx/main.c
> > +++ b/drivers/net/wireless/ath/wcn36xx/main.c
> > @@ -1438,7 +1438,7 @@ static int wcn36xx_init_ieee80211(struct wcn36xx =
*wcn)
> >                 BIT(NL80211_IFTYPE_MESH_POINT);
> >
> >         wcn->hw->wiphy->bands[NL80211_BAND_2GHZ] =3D &wcn_band_2ghz;
> > -       if (wcn->rf_id !=3D RF_IRIS_WCN3620)
> > +       if (wcn->rf_id !=3D RF_IRIS_WCN3620 && wcn->rf_id !=3D RF_IRIS_=
WCN3610)
> >                 wcn->hw->wiphy->bands[NL80211_BAND_5GHZ] =3D &wcn_band_=
5ghz;
> >
> >         if (wcn->rf_id =3D=3D RF_IRIS_WCN3680)
> > @@ -1535,6 +1535,8 @@ static int wcn36xx_platform_get_resources(struct =
wcn36xx *wcn,
> >         /* External RF module */
> >         iris_node =3D of_get_child_by_name(mmio_node, "iris");
> >         if (iris_node) {
> > +               if (of_device_is_compatible(iris_node, "qcom,wcn3610"))
> > +                       wcn->rf_id =3D RF_IRIS_WCN3610;
> >                 if (of_device_is_compatible(iris_node, "qcom,wcn3620"))
> >                         wcn->rf_id =3D RF_IRIS_WCN3620;
> >                 if (of_device_is_compatible(iris_node, "qcom,wcn3660") =
||
> > diff --git a/drivers/net/wireless/ath/wcn36xx/smd.c b/drivers/net/wirel=
ess/ath/wcn36xx/smd.c
> > index 813553edcb..8d5a746de7 100644
> > --- a/drivers/net/wireless/ath/wcn36xx/smd.c
> > +++ b/drivers/net/wireless/ath/wcn36xx/smd.c
> > @@ -83,6 +83,61 @@ static struct wcn36xx_cfg_val wcn36xx_cfg_vals[] =3D=
 {
> >         WCN36XX_CFG_VAL(LINK_FAIL_TX_CNT, 1000),
> >  };
> >
> > +static struct wcn36xx_cfg_val wcn3610_cfg_vals[] =3D {
> > +       WCN36XX_CFG_VAL(CURRENT_TX_ANTENNA, 1),
> > +       WCN36XX_CFG_VAL(CURRENT_RX_ANTENNA, 1),
> > +       WCN36XX_CFG_VAL(LOW_GAIN_OVERRIDE, 0),
> > +       WCN36XX_CFG_VAL(POWER_STATE_PER_CHAIN, 785),
> > +       WCN36XX_CFG_VAL(CAL_PERIOD, 5),
> > +       WCN36XX_CFG_VAL(CAL_CONTROL, 1),
> > +       WCN36XX_CFG_VAL(PROXIMITY, 0),
> > +       WCN36XX_CFG_VAL(NETWORK_DENSITY, 3),
> > +       WCN36XX_CFG_VAL(MAX_MEDIUM_TIME, 6000),
> > +       WCN36XX_CFG_VAL(MAX_MPDUS_IN_AMPDU, 64),
> > +       WCN36XX_CFG_VAL(RTS_THRESHOLD, 2347),
> > +       WCN36XX_CFG_VAL(SHORT_RETRY_LIMIT, 15),
> > +       WCN36XX_CFG_VAL(LONG_RETRY_LIMIT, 15),
> > +       WCN36XX_CFG_VAL(FRAGMENTATION_THRESHOLD, 8000),
> > +       WCN36XX_CFG_VAL(DYNAMIC_THRESHOLD_ZERO, 5),
> > +       WCN36XX_CFG_VAL(DYNAMIC_THRESHOLD_ONE, 10),
> > +       WCN36XX_CFG_VAL(DYNAMIC_THRESHOLD_TWO, 15),
> > +       WCN36XX_CFG_VAL(FIXED_RATE, 0),
> > +       WCN36XX_CFG_VAL(RETRYRATE_POLICY, 4),
> > +       WCN36XX_CFG_VAL(RETRYRATE_SECONDARY, 131),
> > +       WCN36XX_CFG_VAL(RETRYRATE_TERTIARY, 129),
> > +       WCN36XX_CFG_VAL(FORCE_POLICY_PROTECTION, 5),
> > +       WCN36XX_CFG_VAL(FIXED_RATE_MULTICAST_24GHZ, 1),
> > +       WCN36XX_CFG_VAL(FIXED_RATE_MULTICAST_5GHZ, 5),
> > +       WCN36XX_CFG_VAL(DEFAULT_RATE_INDEX_5GHZ, 5),
> > +       WCN36XX_CFG_VAL(DEFAULT_RATE_INDEX_24GHZ, 6),
> > +       WCN36XX_CFG_VAL(MAX_BA_SESSIONS, 40),
> > +       WCN36XX_CFG_VAL(PS_DATA_INACTIVITY_TIMEOUT, 200),
> > +       WCN36XX_CFG_VAL(PS_ENABLE_BCN_FILTER, 1),
> > +       WCN36XX_CFG_VAL(PS_ENABLE_RSSI_MONITOR, 1),
> > +       WCN36XX_CFG_VAL(NUM_BEACON_PER_RSSI_AVERAGE, 20),
> > +       WCN36XX_CFG_VAL(STATS_PERIOD, 10),
> > +       WCN36XX_CFG_VAL(CFP_MAX_DURATION, 30000),
> > +       WCN36XX_CFG_VAL(FRAME_TRANS_ENABLED, 0),
> > +       WCN36XX_CFG_VAL(BA_THRESHOLD_HIGH, 128),
> > +       WCN36XX_CFG_VAL(MAX_BA_BUFFERS, 2560),
> > +       WCN36XX_CFG_VAL(DYNAMIC_PS_POLL_VALUE, 0),
> > +       WCN36XX_CFG_VAL(TX_PWR_CTRL_ENABLE, 1),
> > +       WCN36XX_CFG_VAL(ENABLE_CLOSE_LOOP, 1),
> > +       WCN36XX_CFG_VAL(ENABLE_LPWR_IMG_TRANSITION, 0),
> > +       WCN36XX_CFG_VAL(BTC_EXECUTION_MODE, 2),
> > +       WCN36XX_CFG_VAL(BTC_STATIC_OPP_WLAN_ACTIVE_WLAN_LEN, 90000),
> > +       WCN36XX_CFG_VAL(BTC_STATIC_OPP_WLAN_ACTIVE_BT_LEN, 60000),
> > +       WCN36XX_CFG_VAL(BTC_STATIC_OPP_WLAN_IDLE_WLAN_LEN, 30000),
> > +       WCN36XX_CFG_VAL(BTC_STATIC_OPP_WLAN_IDLE_BT_LEN, 120000),
> > +       WCN36XX_CFG_VAL(BTC_FAST_WLAN_CONN_PREF, 1),
> > +       WCN36XX_CFG_VAL(BTC_STATIC_LEN_LE_BT, 120000),
> > +       WCN36XX_CFG_VAL(BTC_STATIC_LEN_LE_WLAN, 30000),
> > +       WCN36XX_CFG_VAL(MAX_ASSOC_LIMIT, 10),
> > +       WCN36XX_CFG_VAL(ENABLE_MCC_ADAPTIVE_SCHEDULER, 0),
> > +       WCN36XX_CFG_VAL(ENABLE_DYNAMIC_RA_START_RATE, 0),
> > +       WCN36XX_CFG_VAL(LINK_FAIL_TX_CNT, 1000),
> > +};
> > +
> >  static struct wcn36xx_cfg_val wcn3680_cfg_vals[] =3D {
> >         WCN36XX_CFG_VAL(CURRENT_TX_ANTENNA, 1),
> >         WCN36XX_CFG_VAL(CURRENT_RX_ANTENNA, 1),
> > @@ -632,6 +687,9 @@ int wcn36xx_smd_start(struct wcn36xx *wcn)
> >         if (wcn->rf_id =3D=3D RF_IRIS_WCN3680) {
> >                 cfg_vals =3D wcn3680_cfg_vals;
> >                 cfg_elements =3D ARRAY_SIZE(wcn3680_cfg_vals);
> > +       } else if (wcn->rf_id =3D=3D RF_IRIS_WCN3610) {
> > +               cfg_vals =3D wcn3610_cfg_vals;
> > +               cfg_elements =3D ARRAY_SIZE(wcn3610_cfg_vals);
> >         } else {
> >                 cfg_vals =3D wcn36xx_cfg_vals;
> >                 cfg_elements =3D ARRAY_SIZE(wcn36xx_cfg_vals);
> > @@ -2380,7 +2438,8 @@ int wcn36xx_smd_feature_caps_exchange(struct wcn3=
6xx *wcn)
> >         mutex_lock(&wcn->hal_mutex);
> >         INIT_HAL_MSG(msg_body, WCN36XX_HAL_FEATURE_CAPS_EXCHANGE_REQ);
> >
> > -       wcn36xx_firmware_set_feat_caps(msg_body.feat_caps, STA_POWERSAV=
E);
> > +       if (wcn->rf_id !=3D RF_IRIS_WCN3610)
> > +               wcn36xx_firmware_set_feat_caps(msg_body.feat_caps, STA_=
POWERSAVE);
> >         if (wcn->rf_id =3D=3D RF_IRIS_WCN3680) {
> >                 wcn36xx_firmware_set_feat_caps(msg_body.feat_caps, DOT1=
1AC);
> >                 wcn36xx_firmware_set_feat_caps(msg_body.feat_caps, WLAN=
_CH144);
> > diff --git a/drivers/net/wireless/ath/wcn36xx/wcn36xx.h b/drivers/net/w=
ireless/ath/wcn36xx/wcn36xx.h
> > index 7ee79593cd..cb409d48f7 100644
> > --- a/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
> > +++ b/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
> > @@ -96,6 +96,7 @@ enum wcn36xx_ampdu_state {
> >  #define WCN36XX_MAX_POWER(__wcn) (__wcn->hw->conf.chandef.chan->max_po=
wer)
> >
> >  #define RF_UNKNOWN     0x0000
> > +#define RF_IRIS_WCN3610        0x3610
> >  #define RF_IRIS_WCN3620        0x3620
> >  #define RF_IRIS_WCN3660        0x3660
> >  #define RF_IRIS_WCN3680        0x3680
> > --
> > 2.53.0
> >
