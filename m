Return-Path: <vincent.legoll@gmail.com>
Return-Path: <vincent.legoll@gmail.com>
From: Vincent Legoll <vincent.legoll@gmail.com>
Subject: [RFC PATCH v1] Make HWSPINLOCK a menuconfig to ease disabling
Date: Tue, 11 Apr 2017 16:21:01 +0200
Message-Id: <20170411142102.25838-1-vincent.legoll@gmail.com>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hello,

Please review the following patch, it is intended to ease disabling
options for users of 'make menuconfig', so that they won't need to
enter the menu, to disable all HWSPINLOCK-related suboptions at once.

Is this having unwanted side-effects ?

Any feedback appreciated.

Thanks
