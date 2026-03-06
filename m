Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5952E7179
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Mar 2026 00:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772757843; cv=none; b=enEAkKQUy1s0Vn2XcEUrlSaWf5rmryV0stllWvZkl26U5mbZWEPQrWPiYwmEZ6zpadY2EfsEukf0Ky1lLSohoqkTOAmdVWShyfjMXXgQEVIrlaWLKVmWbrgSXvkXyVNdhHkDuruh1E1gX1jOyNgnnnmxoZPRVzCxnEcdFw0NO00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772757843; c=relaxed/simple;
	bh=Pbo6Ncs2XH45+RiMK+FfG7zzkVbxY7P2JwHYAbhBwq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hys+J4qE4NhB3LKoHUwAEsoJdFekKIFjr3pbV36I10A6JG3D8WDOzXdtGMkH4chwZdrv47TfXgeoLL2YD79C36oE95cSSBfUPJEOlgaKCHAraGNfaWZpPqBDYNlDRoUyyMvcptwj9DHMTwh9G/uZ/9gYitpASef97RAbpQuQgG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPAgmMwV; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPAgmMwV"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4043b27ddeaso2602887fac.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Mar 2026 16:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772757841; x=1773362641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaIluGXx/Vhq+ZEeriR1MIRiJ/bHLPjLpQYgZ6GDJVY=;
        b=KPAgmMwVvUVDI/orvIxpyx3FSLFlwLlv2Dkv4DHb0wPviju2X4qAWandEZL25ag1+W
         1nsvlfNoEUt24V98kHPZdde1x/kFn5uAbZKtfl6UQjWkzJN30YZf8Itg2kV/nsSJkV94
         nKXz9vWoUDlcOGLeVzJvAhfbEJ4G/I+evGinSTVGingNamLag4uQ2iypRP2XzdRmAQEY
         eyGFlDAZSJo4Kl2ozs53tBj8PVELNegdIybO8ipddXk2Oxeup8fK2u7RxM+IT1y5De7m
         zOtrnZQ12mTK2hMzkJCEURVk/8U8XkL2UxXt9F1+ujUKB9XHIwLzqnmMf9yA+RwhRGY+
         aAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772757841; x=1773362641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XaIluGXx/Vhq+ZEeriR1MIRiJ/bHLPjLpQYgZ6GDJVY=;
        b=fhxUS+r8GqmhYBUYZdC5hN38Muwwyn+qJ6ISHmyeippBXGjZ9gNhiqrl9+MQfcWNJH
         Be+0fNKPkoSbZWau9BEIFViOxCPGNilt0oHsE6MeiUy3ZAz/3tXhK++vrd0Fb5IM9RNF
         bomjo09IbLtli+yHhDxUoIg/L2ETXHfOoJxmT1qDI4MVkcWwpcF6R/yHZBUrHplfYGxZ
         SKIceiH774wkcvmfVDzaTtqOB7r47k6aYpjDwMhzQRxFSllA5l3+a7InQSoAsLhSy9mg
         1CQNRU5iUJm4OwsqZZB14CfgaQYV2G+h2b2JYD+FADiCb5+di4PNtI6R8Aqh2Rc/oNO5
         pfKA==
X-Forwarded-Encrypted: i=1; AJvYcCV2UMzPADYwTFZj7t3tCvmygsZLMiQcfiRGvpN/PKxPCWLnXEW1kHteU7ct88nK2bV1cP+est14JqKoO41qZrgl@vger.kernel.org
X-Gm-Message-State: AOJu0YxCV9rdgOq9XaEW6VTpJ4Alhq3HTn9o28Nq+axMicKfsWIlEIel
	4uDrzN/4vrMhAlhJ1M5Mal9c7tr+EZobZW2GY3+NYoNA7mqUSxJ0eWCw
X-Gm-Gg: ATEYQzwny2oPDykT4aXSV5wEk+C3U5/60jFeY6BI57Meb5wTmMniZoWrfUpMs1bU7aH
	gLluucHACF4skcquy6pJJEKiOMJvsdo3dF0orMOXn71YaPr4qVqkcSQkpwfFf4BFsALWjt9lbmc
	Xx2iCjUdyJNG0SwjWcPothCOAN7wOPsZ4w2XDxwlZkQDygBiumWDnQy1pOPZskePkssAqhcSf8G
	8v4mIr5BXbTx0F+IodWR4L19MEbB1Jol4WusYuz0DcqfisOHqlgJaatXAv9/Mci8COSOEgReRt0
	ITIq6USqK3AFHuU6AXxLYL7B7bq8rLvpQUhsBR22BGfgebALeas/07Cg52aPQ350w3UfUkocLap
	g1NuVvpec2zuNbXwBD7mUd53gN0iftRhBoa/h6l+1HUPb2820tpuwK80hskl9DSWI7zmyfa/wve
	gy/8hrBJqq/mw9iJv54I9RRKp8dClaMOKthjTEyY4fMX0nivgASZ9lUdludJ8Z90iWh/uebD7sD
	6HkLTkk5nmTK9v1/P0jfpAnDYPgj+x6lcOJCCXelg==
X-Received: by 2002:a05:6870:34a:b0:409:5ad9:67d5 with SMTP id 586e51a60fabf-416e452461emr222992fac.40.1772757840712;
        Thu, 05 Mar 2026 16:44:00 -0800 (PST)
Received: from framework.misc.iastate.edu ([2610:130:110:25d:2aa4:4aff:fed7:9b19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-416e65b1c82sm69335fac.5.2026.03.05.16.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 16:43:59 -0800 (PST)
From: Kerigan Creighton <kerigancreighton@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	wcn36xx@lists.infradead.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kerigan Creighton <kerigancreighton@gmail.com>
Subject: [PATCH v3 3/3] wifi: wcn36xx: Add support for WCN3610
Date: Thu,  5 Mar 2026 18:43:44 -0600
Message-ID: <20260306004344.10968-4-kerigancreighton@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306004344.10968-1-kerigancreighton@gmail.com>
References: <20260306004344.10968-1-kerigancreighton@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The WCN3610 has a lot in common with the other wcn36xx
chips, so much of that code was reused.

The WCN3610 requires specific configuration values for
stable Wi-Fi. Without these values, there's packet loss.
An extra CFG table was made so other chips are not affected.

ENABLE_DYNAMIC_RA_START_RATE=0 was discovered from the
downstream prima driver. That brought it from 95% to 5%
packet loss. The rest of the CFG values came from my own
observations and experimentation. The current settings
allow for 0% packet loss.

STA_POWERSAVE resulted in BMPS errors and unstable
functionality, thus it has been disabled for just this
chip.

Tested on an Anki Vector 1.0 and 2.0 robot with 3
different APs. Support for other WCN36xx chips has not
been affected.

Signed-off-by: Kerigan Creighton <kerigancreighton@gmail.com>
---
Changes in v2:
 - Move wcn36xx driver changes to the end of the patch set.

Changes in v3:
 - Describe where the CFG values came from in the wcn36xx
   driver patch [Konrad].
---
 drivers/net/wireless/ath/wcn36xx/main.c    |  4 +-
 drivers/net/wireless/ath/wcn36xx/smd.c     | 61 +++++++++++++++++++++-
 drivers/net/wireless/ath/wcn36xx/wcn36xx.h |  1 +
 3 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/wcn36xx/main.c b/drivers/net/wireless/ath/wcn36xx/main.c
index c3f0860873..6c90c13251 100644
--- a/drivers/net/wireless/ath/wcn36xx/main.c
+++ b/drivers/net/wireless/ath/wcn36xx/main.c
@@ -1438,7 +1438,7 @@ static int wcn36xx_init_ieee80211(struct wcn36xx *wcn)
 		BIT(NL80211_IFTYPE_MESH_POINT);
 
 	wcn->hw->wiphy->bands[NL80211_BAND_2GHZ] = &wcn_band_2ghz;
-	if (wcn->rf_id != RF_IRIS_WCN3620)
+	if (wcn->rf_id != RF_IRIS_WCN3620 && wcn->rf_id != RF_IRIS_WCN3610)
 		wcn->hw->wiphy->bands[NL80211_BAND_5GHZ] = &wcn_band_5ghz;
 
 	if (wcn->rf_id == RF_IRIS_WCN3680)
@@ -1535,6 +1535,8 @@ static int wcn36xx_platform_get_resources(struct wcn36xx *wcn,
 	/* External RF module */
 	iris_node = of_get_child_by_name(mmio_node, "iris");
 	if (iris_node) {
+		if (of_device_is_compatible(iris_node, "qcom,wcn3610"))
+			wcn->rf_id = RF_IRIS_WCN3610;
 		if (of_device_is_compatible(iris_node, "qcom,wcn3620"))
 			wcn->rf_id = RF_IRIS_WCN3620;
 		if (of_device_is_compatible(iris_node, "qcom,wcn3660") ||
diff --git a/drivers/net/wireless/ath/wcn36xx/smd.c b/drivers/net/wireless/ath/wcn36xx/smd.c
index 813553edcb..8d5a746de7 100644
--- a/drivers/net/wireless/ath/wcn36xx/smd.c
+++ b/drivers/net/wireless/ath/wcn36xx/smd.c
@@ -83,6 +83,61 @@ static struct wcn36xx_cfg_val wcn36xx_cfg_vals[] = {
 	WCN36XX_CFG_VAL(LINK_FAIL_TX_CNT, 1000),
 };
 
+static struct wcn36xx_cfg_val wcn3610_cfg_vals[] = {
+	WCN36XX_CFG_VAL(CURRENT_TX_ANTENNA, 1),
+	WCN36XX_CFG_VAL(CURRENT_RX_ANTENNA, 1),
+	WCN36XX_CFG_VAL(LOW_GAIN_OVERRIDE, 0),
+	WCN36XX_CFG_VAL(POWER_STATE_PER_CHAIN, 785),
+	WCN36XX_CFG_VAL(CAL_PERIOD, 5),
+	WCN36XX_CFG_VAL(CAL_CONTROL, 1),
+	WCN36XX_CFG_VAL(PROXIMITY, 0),
+	WCN36XX_CFG_VAL(NETWORK_DENSITY, 3),
+	WCN36XX_CFG_VAL(MAX_MEDIUM_TIME, 6000),
+	WCN36XX_CFG_VAL(MAX_MPDUS_IN_AMPDU, 64),
+	WCN36XX_CFG_VAL(RTS_THRESHOLD, 2347),
+	WCN36XX_CFG_VAL(SHORT_RETRY_LIMIT, 15),
+	WCN36XX_CFG_VAL(LONG_RETRY_LIMIT, 15),
+	WCN36XX_CFG_VAL(FRAGMENTATION_THRESHOLD, 8000),
+	WCN36XX_CFG_VAL(DYNAMIC_THRESHOLD_ZERO, 5),
+	WCN36XX_CFG_VAL(DYNAMIC_THRESHOLD_ONE, 10),
+	WCN36XX_CFG_VAL(DYNAMIC_THRESHOLD_TWO, 15),
+	WCN36XX_CFG_VAL(FIXED_RATE, 0),
+	WCN36XX_CFG_VAL(RETRYRATE_POLICY, 4),
+	WCN36XX_CFG_VAL(RETRYRATE_SECONDARY, 131),
+	WCN36XX_CFG_VAL(RETRYRATE_TERTIARY, 129),
+	WCN36XX_CFG_VAL(FORCE_POLICY_PROTECTION, 5),
+	WCN36XX_CFG_VAL(FIXED_RATE_MULTICAST_24GHZ, 1),
+	WCN36XX_CFG_VAL(FIXED_RATE_MULTICAST_5GHZ, 5),
+	WCN36XX_CFG_VAL(DEFAULT_RATE_INDEX_5GHZ, 5),
+	WCN36XX_CFG_VAL(DEFAULT_RATE_INDEX_24GHZ, 6),
+	WCN36XX_CFG_VAL(MAX_BA_SESSIONS, 40),
+	WCN36XX_CFG_VAL(PS_DATA_INACTIVITY_TIMEOUT, 200),
+	WCN36XX_CFG_VAL(PS_ENABLE_BCN_FILTER, 1),
+	WCN36XX_CFG_VAL(PS_ENABLE_RSSI_MONITOR, 1),
+	WCN36XX_CFG_VAL(NUM_BEACON_PER_RSSI_AVERAGE, 20),
+	WCN36XX_CFG_VAL(STATS_PERIOD, 10),
+	WCN36XX_CFG_VAL(CFP_MAX_DURATION, 30000),
+	WCN36XX_CFG_VAL(FRAME_TRANS_ENABLED, 0),
+	WCN36XX_CFG_VAL(BA_THRESHOLD_HIGH, 128),
+	WCN36XX_CFG_VAL(MAX_BA_BUFFERS, 2560),
+	WCN36XX_CFG_VAL(DYNAMIC_PS_POLL_VALUE, 0),
+	WCN36XX_CFG_VAL(TX_PWR_CTRL_ENABLE, 1),
+	WCN36XX_CFG_VAL(ENABLE_CLOSE_LOOP, 1),
+	WCN36XX_CFG_VAL(ENABLE_LPWR_IMG_TRANSITION, 0),
+	WCN36XX_CFG_VAL(BTC_EXECUTION_MODE, 2),
+	WCN36XX_CFG_VAL(BTC_STATIC_OPP_WLAN_ACTIVE_WLAN_LEN, 90000),
+	WCN36XX_CFG_VAL(BTC_STATIC_OPP_WLAN_ACTIVE_BT_LEN, 60000),
+	WCN36XX_CFG_VAL(BTC_STATIC_OPP_WLAN_IDLE_WLAN_LEN, 30000),
+	WCN36XX_CFG_VAL(BTC_STATIC_OPP_WLAN_IDLE_BT_LEN, 120000),
+	WCN36XX_CFG_VAL(BTC_FAST_WLAN_CONN_PREF, 1),
+	WCN36XX_CFG_VAL(BTC_STATIC_LEN_LE_BT, 120000),
+	WCN36XX_CFG_VAL(BTC_STATIC_LEN_LE_WLAN, 30000),
+	WCN36XX_CFG_VAL(MAX_ASSOC_LIMIT, 10),
+	WCN36XX_CFG_VAL(ENABLE_MCC_ADAPTIVE_SCHEDULER, 0),
+	WCN36XX_CFG_VAL(ENABLE_DYNAMIC_RA_START_RATE, 0),
+	WCN36XX_CFG_VAL(LINK_FAIL_TX_CNT, 1000),
+};
+
 static struct wcn36xx_cfg_val wcn3680_cfg_vals[] = {
 	WCN36XX_CFG_VAL(CURRENT_TX_ANTENNA, 1),
 	WCN36XX_CFG_VAL(CURRENT_RX_ANTENNA, 1),
@@ -632,6 +687,9 @@ int wcn36xx_smd_start(struct wcn36xx *wcn)
 	if (wcn->rf_id == RF_IRIS_WCN3680) {
 		cfg_vals = wcn3680_cfg_vals;
 		cfg_elements = ARRAY_SIZE(wcn3680_cfg_vals);
+	} else if (wcn->rf_id == RF_IRIS_WCN3610) {
+		cfg_vals = wcn3610_cfg_vals;
+		cfg_elements = ARRAY_SIZE(wcn3610_cfg_vals);
 	} else {
 		cfg_vals = wcn36xx_cfg_vals;
 		cfg_elements = ARRAY_SIZE(wcn36xx_cfg_vals);
@@ -2380,7 +2438,8 @@ int wcn36xx_smd_feature_caps_exchange(struct wcn36xx *wcn)
 	mutex_lock(&wcn->hal_mutex);
 	INIT_HAL_MSG(msg_body, WCN36XX_HAL_FEATURE_CAPS_EXCHANGE_REQ);
 
-	wcn36xx_firmware_set_feat_caps(msg_body.feat_caps, STA_POWERSAVE);
+	if (wcn->rf_id != RF_IRIS_WCN3610)
+		wcn36xx_firmware_set_feat_caps(msg_body.feat_caps, STA_POWERSAVE);
 	if (wcn->rf_id == RF_IRIS_WCN3680) {
 		wcn36xx_firmware_set_feat_caps(msg_body.feat_caps, DOT11AC);
 		wcn36xx_firmware_set_feat_caps(msg_body.feat_caps, WLAN_CH144);
diff --git a/drivers/net/wireless/ath/wcn36xx/wcn36xx.h b/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
index 7ee79593cd..cb409d48f7 100644
--- a/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
+++ b/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
@@ -96,6 +96,7 @@ enum wcn36xx_ampdu_state {
 #define WCN36XX_MAX_POWER(__wcn) (__wcn->hw->conf.chandef.chan->max_power)
 
 #define RF_UNKNOWN	0x0000
+#define RF_IRIS_WCN3610	0x3610
 #define RF_IRIS_WCN3620	0x3620
 #define RF_IRIS_WCN3660	0x3660
 #define RF_IRIS_WCN3680	0x3680
-- 
2.53.0

