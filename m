Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 6 Feb 2017 13:19:55 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 1/4] remoteproc: st: correct probe error management
Message-ID: <20170206211955.GI31134@builder>
References: <1485866156-6364-1-git-send-email-loic.pallardy@st.com>
 <1485866156-6364-2-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1485866156-6364-2-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: ohad@wizery.com, lee.jones@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, patrice.chotard@st.com, hugues.fruchet@st.com, peter.griffin@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 31 Jan 04:35 PST 2017, Loic Pallardy wrote:

> Associated clock is prepared in st_rproc_parse_dt function.
> it should be unprepared in case of error during probing.
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>

Applied patch 1 and 2.

Regards,
Bjorn
